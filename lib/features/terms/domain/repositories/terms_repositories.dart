

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/terms/domain/entity/terms_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TermsRepositories{

  Future<Either<Failure,TermsEntity>>getTerms();

}