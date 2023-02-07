


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/contact_us/domain/entity/contact_us_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContactUsRepositories{

  Future<Either<Failure,ContactUsEntity>>getContactUs();

}