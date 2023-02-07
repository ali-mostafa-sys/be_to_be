

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/contact_us/domain/entity/contact_us_entity.dart';
import 'package:be_to_be/features/contact_us/domain/repositories/contact_us_repositories.dart';
import 'package:dartz/dartz.dart';

class GetContactUsUseCase {


  final ContactUsRepositories contactUsRepositories;
  const GetContactUsUseCase({
    required this.contactUsRepositories,
  });

  Future<Either<Failure,ContactUsEntity>>call()async{
    return await contactUsRepositories.getContactUs();
  }

}