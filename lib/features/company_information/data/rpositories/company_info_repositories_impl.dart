
import 'dart:io';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/company_information/data/data_source/company_info_remote_data_source/company_info_remote_data_source.dart';
import 'package:be_to_be/features/company_information/data/models/add_company_mosel/add_company_model.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/all_company_type_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/city_entity/city_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/upload_image_entity/response_upload_image_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class CompanyInfoRepositoriesImpl implements CompanyInfoRepositories{
  final NetworkInfo networkInfo;
  final CompanyInfoRemoteDataSource companyInfoRemoteDataSource;


  const CompanyInfoRepositoriesImpl({
    required this.networkInfo,
    required this.companyInfoRemoteDataSource,
});
  ///
/// here for get all company type///////////////////////////
  ///
  @override
  Future<Either<Failure, AllCompanyTypeEntity>> getAllCompanyType() async{
    if (await networkInfo.isConnected) {
      try {
        final allCompanyTypeEntity = await companyInfoRemoteDataSource.getAllCompanyType();

        return Right(allCompanyTypeEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
///
/// here for upload image/////////////////////////////////
  ///
  @override
  Future<Either<Failure, ResponseUploadImageEntity>> postUploadImage(File imageFile)async {
    if (await networkInfo.isConnected) {
      try {
        final imageUrl = await companyInfoRemoteDataSource.postUploadImage(imageFile);


        return Right(imageUrl);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

  }
  ///
/// here for get all country////////////////////////////
  ///
  @override
  Future<Either<Failure, List<CountryEntity>>> getAllCountry()async {
    if (await networkInfo.isConnected) {
      try {
        final allCountryEntity= await companyInfoRemoteDataSource.getAllCountry();

        return Right(allCountryEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  ///
  /// here for get all cities////////////////////////////
  ///
  @override
  Future<Either<Failure, List<CityEntity>>> getAllCities(int countryId)async {
    if (await networkInfo.isConnected) {
      try {
        final allCitiesEntity = await companyInfoRemoteDataSource.getAllCities(countryId);

        return Right(allCitiesEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
///
  /// here for add company
  ///
  @override
  Future<Either<Failure, Unit>> postAddCompany(AddCompanyEntity addCompanyEntity)async {
    final addCompanyModel= AddCompanyModel(
        nameEn:addCompanyEntity. nameEn,
        companyTypeId:addCompanyEntity. companyTypeId,
        licenseNumber: addCompanyEntity.licenseNumber,
        establishAt: addCompanyEntity.establishAt,
        licenseImgUrl:addCompanyEntity. licenseImgUrl,
        cityId:addCompanyEntity. cityId,
        area:addCompanyEntity. area,
        street:addCompanyEntity. street,
        buildingNumber:addCompanyEntity. buildingNumber,
        addressLongitude:addCompanyEntity. addressLongitude,
        addressLatitude:addCompanyEntity. addressLatitude,
        moreAddressInfo:addCompanyEntity. moreAddressInfo,
        licenseExpirAt: addCompanyEntity.licenseExpirAt);
    if (await networkInfo.isConnected) {
      try {
         await companyInfoRemoteDataSource.postAddCompany(addCompanyModel);

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }


}