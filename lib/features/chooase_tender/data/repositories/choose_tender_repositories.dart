

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/chooase_tender/data/data_source/choose_tender_data_cource/choose_tender_remot_data_source.dart';
import 'package:be_to_be/features/chooase_tender/data/models/care_model/care_model.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class ChooseTenderRepositoriesImpl implements ChooseTenderRepositories{
  final NetworkInfo networkInfo;
  final ChooseTenderRemoteDataSource chooseTenderRemoteDataSource;
  const ChooseTenderRepositoriesImpl({
    required this.chooseTenderRemoteDataSource,
    required this.networkInfo
});




  ///
  /// here for get categories
  ///
  @override
  Future<Either<Failure, List<CategoriesChooseTenderEntity>>> getCategories() async{

    if(await networkInfo.isConnected){
      try{
        final categories=await chooseTenderRemoteDataSource.getCategories();

        return Right(categories);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }
///
  /// here for post cares
  ///
  @override
  Future<Either<Failure, Unit>> postCare(DataEntity dataEntity)async {
   final dataModel=DataModel(
       categories:dataEntity.categoryEntity,
     brands: dataEntity.brandEntity,
     products: dataEntity.productEntity
   );
   if(await networkInfo.isConnected){
     try{
       await chooseTenderRemoteDataSource.postCare(dataModel);
       return const Right(unit);
     }on ServerException{
       return Left(ServerFailure());
     }

   }else
     {
       return Left(OfflineFailure());
     }




  }
///
  /// here for get brands
  ///
  @override
  Future<Either<Failure, List<BrandChooseTenderEntity>>> getBrand() async{
    if(await networkInfo.isConnected){
      try{
        final brands=await chooseTenderRemoteDataSource.getBrands();
        return Right(brands);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }
///
  /// here for get products
  ///
  @override
  Future<Either<Failure, List<ProductChooseTenderEntity>>> getProducts() async{
    if(await networkInfo.isConnected){
      try{
        final products=await chooseTenderRemoteDataSource.getProducts();
        return Right(products);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}