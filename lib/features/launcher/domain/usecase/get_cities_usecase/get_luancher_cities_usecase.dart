


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/launcher/domain/repositories/launcher_cities_repositories.dart';
import 'package:dartz/dartz.dart';

class GetLauncherCitiesUseCase {

  final  LauncherRepositories launcherRepositories;
  const GetLauncherCitiesUseCase({
    required this.launcherRepositories
});
  Future<Either<Failure,Unit>>call()async{
    return await launcherRepositories.getCities();
  }



}