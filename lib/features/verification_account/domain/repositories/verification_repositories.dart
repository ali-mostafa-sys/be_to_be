

import 'package:be_to_be/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class VerificationRepositories {

  Future<Either<Failure,Unit>>postVerificationCode(String loginName);
  Future<Either<Failure,Unit>>getVerificationCode(String loginName,String code);

}