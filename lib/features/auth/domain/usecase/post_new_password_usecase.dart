

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class PostNewPasswordUseCase{
  final AuthRepositories authRepositories;
  const PostNewPasswordUseCase({required this.authRepositories});

  Future<Either<Failure,Unit>>call({required String email,required String password,required String code})async{
    return await authRepositories.postNewPassword(email: email, password: password, code: code);

  }
}