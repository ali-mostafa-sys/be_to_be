


import 'package:be_to_be/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LauncherRepositories{

  Future<Either<Failure,Unit>>getCities();


}