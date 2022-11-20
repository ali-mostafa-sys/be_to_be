import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_response_entity.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase{

  final AuthRepositories authRepositories;
  const LoginUseCase({required this.authRepositories});
  Future <Either<Failure,LoginResponseEntity>>call(LoginEntity loginEntity)async{
    return await authRepositories.postLogin(loginEntity);
  }

}