


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/privacy/domain/entity/privacy_entity.dart';
import 'package:be_to_be/features/privacy/domain/repositories/privacy_repositories.dart';
import 'package:dartz/dartz.dart';

class GetPrivacyUseCase{

  final PrivacyRepositories privacyRepositories;
  const GetPrivacyUseCase({
    required this.privacyRepositories
});

  Future<Either<Failure,PrivacyEntity>>call()async{
    return await privacyRepositories.getPrivacy();
  }

}