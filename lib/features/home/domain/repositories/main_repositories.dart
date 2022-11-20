

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepositories {
  Future <Either<Failure,IsLoggedEntity>>getIsLogged();
}