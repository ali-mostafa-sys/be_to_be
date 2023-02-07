


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/add_tender/domain/entity/city_add_tender_entity/city_add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllCitiesAddTenderUseCase {

  final AddTenderRepositories addTenderRepositories;
  const GetAllCitiesAddTenderUseCase({required this.addTenderRepositories});

  Future<Either<Failure,List<CityAddTenderEntity>>>call(int countryId)async{
    return await addTenderRepositories.getAllCitiesAddTender(countryId);
  }
}