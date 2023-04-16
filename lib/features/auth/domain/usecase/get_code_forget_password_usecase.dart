


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class GetForgetPasswordUseCase{

  final AuthRepositories authRepositories;
  const GetForgetPasswordUseCase({
    required this.authRepositories
});

  Future<Either<Failure,Unit>>call(String email)async{
    return await authRepositories.getForgerPasswordCode(email);
  }

}