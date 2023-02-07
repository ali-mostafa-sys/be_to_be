

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/city_add_tender_entity/city_add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/get_country_entity/get_country_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/product_entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AddTenderRepositories {

  Future<Either<Failure,List<ProductEntity>>>getAllProduct();
  Future<Either<Failure,Unit>>postAddTender(AddTenderEntity addTenderEntity);
  Future<Either<Failure,List<CountriesEntity>>>getCountries();
  Future<Either<Failure,List<CityAddTenderEntity>>>getAllCitiesAddTender(int countryId);


}