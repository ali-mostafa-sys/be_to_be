

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/verification_account/domain/repositories/verification_repositories.dart';
import 'package:dartz/dartz.dart';

class GetVerificationCodeUseCase{

  final VerificationRepositories verificationRepositories;

  const GetVerificationCodeUseCase({
    required this.verificationRepositories
});
  Future<Either<Failure,Unit>>call({
   required String loginName,required String code
})async{
    return await verificationRepositories.getVerificationCode(loginName, code);
  }



}