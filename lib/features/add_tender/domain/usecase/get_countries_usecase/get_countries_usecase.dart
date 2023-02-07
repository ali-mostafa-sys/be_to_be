

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/add_tender/domain/entity/get_country_entity/get_country_entity.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCountriesAddTenderUseCase {
  final AddTenderRepositories addTenderRepositories;
  const GetCountriesAddTenderUseCase({required this.addTenderRepositories});

  Future<Either<Failure,List<CountriesEntity>>>call()async{
    return await addTenderRepositories.getCountries();
  }
}