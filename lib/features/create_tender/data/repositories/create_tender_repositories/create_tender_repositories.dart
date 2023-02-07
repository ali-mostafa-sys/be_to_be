

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/create_tender/data/data_source/create_tender_remote_data_source/create_tender_remote_data_source.dart';
import 'package:be_to_be/features/create_tender/data/models/add_brand_model/add_brand_model.dart';
import 'package:be_to_be/features/create_tender/data/models/add_product_model/add_product_model.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/brand_entity/brand_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/category_entity/category_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class CreateTenderRepositoriesImpl implements CreateTenderRepositories{

  final CreateTenderRemoteDataSource createTenderRemoteDataSource;
  final NetworkInfo networkInfo;

  const CreateTenderRepositoriesImpl({
    required this.createTenderRemoteDataSource,
    required this.networkInfo,
});
///
  /// here for get brands
  ///
  @override
  Future<Either<Failure, List<BrandCreateTenderEntity>>> getBrandsOfCreate() async{
    if(await networkInfo.isConnected){
      try{
        final brands=await createTenderRemoteDataSource.getBrands();

        return Right(brands);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  ///
  /// here for get categories
  ///
  @override
  Future<Either<Failure, List<CategoriesCreateTenderEntity>>> getCategoriesOfCreate()async {
    if(await networkInfo.isConnected){
      try{
        final categories=await createTenderRemoteDataSource.getCategories();

        return Right(categories);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }
///
  /// here for add new brand
  ///
  @override
  Future<Either<Failure, Unit>> postAddBrand(AddBrandEntity addBrandEntity) async{
   final addBrandModel=AddBrandModel(nameEn:addBrandEntity. nameEn,
       descriptionEn:addBrandEntity. descriptionEn,
       categoryId:addBrandEntity. categoryId);
   if(await networkInfo.isConnected){
     try{
       await createTenderRemoteDataSource.postAddBrand(addBrandModel);
       return const  Right(unit);
     }on ServerException{
       return Left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for upload image
  ///
  @override
  Future<Either<Failure, String>> uploadImage(UploadCTImageEntity uploadCTImageEntity) async{
    if (await networkInfo.isConnected) {
      try {
        final imageUrl = await createTenderRemoteDataSource.postUploadImage(uploadCTImageEntity.imageFile);


        return Right(imageUrl);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
///
  /// here for add new product
  ///
  @override
  Future<Either<Failure, Unit>> postAddProduct(AddProductEntity addProductEntity)async {
    final addProductModel=AddProductModel(nameEn: addProductEntity.nameEn,
        descriptionEn:addProductEntity. descriptionEn,
        imgUrl:addProductEntity. imgUrl,
        brandId:addProductEntity. brandId);
    if(await networkInfo.isConnected){
      try{
        await createTenderRemoteDataSource.postAddProduct(addProductModel);
        return const Right(unit);


      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure( ));
    }
  }





}