

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/about_us/domain/entity/about_us_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AboutUsRepositories{

Future<Either<Failure,List<AboutUsEntity>>>getAboutUs();



}