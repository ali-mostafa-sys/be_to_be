
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/city_entity/city_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllCitiesUseCase {

  final CompanyInfoRepositories companyInfoRepositories;

  const GetAllCitiesUseCase({required this.companyInfoRepositories});
  Future <Either<Failure,List<CityEntity>>>call(int countryId)async{
    return await companyInfoRepositories.getAllCities(countryId);
  }
}