import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {

  final AuthRepositories authRepositories;
  const RegisterUseCase({required this.authRepositories});

  Future<Either<Failure,Unit>>call(RegisterEntity registerEntity)async{
    return await authRepositories.postRegister(registerEntity);
  }
}