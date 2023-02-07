

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/verification_account/domain/repositories/verification_repositories.dart';
import 'package:dartz/dartz.dart';

class PostVerificationCodeUseCase{

  final VerificationRepositories verificationRepositories;
  const PostVerificationCodeUseCase({
    required this.verificationRepositories
});

  Future<Either<Failure,Unit>>call(String loginName)async{
    return await verificationRepositories.postVerificationCode(loginName);
  }


}