import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:be_to_be/features/auth/data/models/login_models/login_model.dart';
import 'package:be_to_be/features/auth/data/models/register_models/register_model.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_response_entity.dart';
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  const AuthRepositoriesImpl(
      {required this.authDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponseEntity>> postLogin(LoginEntity loginEntity) async {
    final loginModel =
        LoginModel(email: loginEntity.email, password: loginEntity.password);

    if (await networkInfo.isConnected) {
      try {
       final loginResponseModel= await authDataSource.postLogin(loginModel);

        return  Right(loginResponseModel);
      } on ServerException {
        return left(ServerFailure());
      } on InvalidEmailAndPasswordException {
        return left(InvalidEmailAndPasswordFailure());
      }  on AccountNotVerificationException {
        return left(AccountNotVerificationFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> postRegister(RegisterEntity registerEntity)async {

    final registerModel=RegisterModel(
        firstName: registerEntity.firstName,
        lastName: registerEntity.lastName,
        email: registerEntity.email,
        mobileNumber: registerEntity.mobileNumber,
        password: registerEntity.password,
        birthDate: registerEntity.birthDate,
        gender: registerEntity.gender,
        hasMobileWhatsApp: registerEntity.hasMobileWhatsApp);

    if(await networkInfo.isConnected){
      try {
        await authDataSource.postRegister(registerModel);

        return const Right(unit);
      } on ServerException {
        return left(ServerFailure());
      } on DuplicateUserException {
        return left(DuplicateUserFailure());
      } on InvalidEmailException {
        return left(InvalidEmailFailure());
      }

    }else{

      return Left(OfflineFailure());
    }

  }
}
