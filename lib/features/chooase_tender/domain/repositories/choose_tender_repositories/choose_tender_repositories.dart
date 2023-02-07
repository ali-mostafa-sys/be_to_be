
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChooseTenderRepositories{

  Future<Either<Failure,List<CategoriesChooseTenderEntity>>>getCategories();
  Future<Either<Failure,List<BrandChooseTenderEntity>>>getBrand();
  Future<Either<Failure,List<ProductChooseTenderEntity>>>getProducts();
  Future<Either<Failure,Unit>>postCare(DataEntity dataEntity);

}