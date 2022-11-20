

import 'dart:io';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/all_company_type_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/city_entity/city_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/upload_image_entity/response_upload_image_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyInfoRepositories{

  Future <Either<Failure,AllCompanyTypeEntity>> getAllCompanyType();
  Future <Either<Failure,ResponseUploadImageEntity>>postUploadImage(File imageFile);
  Future <Either<Failure,List<CountryEntity>>>getAllCountry();
  Future<Either<Failure,List<CityEntity>>>getAllCities(int countryId);
  Future<Either<Failure,Unit>>postAddCompany(AddCompanyEntity addCompanyEntity);
}