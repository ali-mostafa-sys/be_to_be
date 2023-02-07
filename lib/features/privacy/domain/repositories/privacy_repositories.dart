


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/privacy/domain/entity/privacy_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PrivacyRepositories{

  Future<Either<Failure,PrivacyEntity>>getPrivacy();


}