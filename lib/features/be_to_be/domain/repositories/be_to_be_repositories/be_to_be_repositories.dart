

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BeToBeRepositories{

  Future<Either<Failure,List<BeToBeEntity>>>getBeToBePage();
}