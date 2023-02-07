


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/about_us/domain/entity/about_us_entity.dart';
import 'package:be_to_be/features/about_us/domain/repositories/about_us_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAboutUsUseCase {

  final AboutUsRepositories aboutUsRepositories;
  const GetAboutUsUseCase({
    required this.aboutUsRepositories
});

  Future<Either<Failure,List<AboutUsEntity>>>call()async{
    return await aboutUsRepositories.getAboutUs();
  }


}