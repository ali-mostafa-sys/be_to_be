

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllCountryUseCase{
  final CompanyInfoRepositories companyInfoRepositories;
  const GetAllCountryUseCase({
    required this.companyInfoRepositories
});
  Future <Either<Failure,List<CountryEntity>>>call()async{
    return await companyInfoRepositories.getAllCountry();
  }

}