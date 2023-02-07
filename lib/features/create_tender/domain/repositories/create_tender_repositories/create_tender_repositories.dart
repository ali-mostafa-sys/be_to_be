


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/brand_entity/brand_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/category_entity/category_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CreateTenderRepositories{

  Future<Either<Failure,List<CategoriesCreateTenderEntity>>>getCategoriesOfCreate();
  Future<Either<Failure,List<BrandCreateTenderEntity>>>getBrandsOfCreate();
  Future<Either<Failure,Unit>>postAddBrand(AddBrandEntity addBrandEntity);
  Future<Either<Failure,String>>uploadImage(UploadCTImageEntity uploadCTImageEntity);
  Future<Either<Failure,Unit>>postAddProduct(AddProductEntity addProductEntity);

}