


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/faq/domain/entity/fqa_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FQARepositories{

  Future<Either<Failure,List<FQAEntity>>>getFQA();

}