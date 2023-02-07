


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/add_tender/data/data_source/add_tender_remote_data_source/add_tender_remote_data_source.dart';
import 'package:be_to_be/features/add_tender/data/models/add_tender_model/add_tender_model.dart';
import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/city_add_tender_entity/city_add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/get_country_entity/get_country_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class AddTenderRepositoriesImpl implements AddTenderRepositories{
  final AddTenderRemoteDataSource addTenderRemoteDataSource;
  final NetworkInfo networkInfo;
  const AddTenderRepositoriesImpl({
    required this.addTenderRemoteDataSource,
    required this.networkInfo,
});



  ///
  /// here for get all product list
  ///
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct() async{

    if(await networkInfo.isConnected){

      try{
        final productList=await addTenderRemoteDataSource.getAllProduct();
        return Right(productList);
      }on ServerException{
        return Left(ServerFailure());
      }






    }else{
      return Left(OfflineFailure());
    }

  }
///
  /// here for add tender
  ///
  @override
  Future<Either<Failure, Unit>> postAddTender(AddTenderEntity addTenderEntity)async {
   final addTenderModel=AddTenderModel(
       name:addTenderEntity. name,
       from:addTenderEntity. from,
       to:addTenderEntity. to,
       deliverBefore: addTenderEntity.deliverBefore,
       area:addTenderEntity. area,
       street:addTenderEntity. street,
       buildingNumber:addTenderEntity. buildingNumber,
       moreAddressInfo:addTenderEntity. moreAddressInfo,
       supplierLocation: addTenderEntity.supplierLocation,
       payMethod:addTenderEntity. payMethod,
       productId:addTenderEntity. productId,
       quantity:addTenderEntity. quantity,
       cityId:addTenderEntity. cityId);
   if(await networkInfo.isConnected){
     try{
       await addTenderRemoteDataSource.postAddTender(addTenderModel);
       return const Right(unit);
     } on ServerException{
       return Left(ServerFailure());
     }on AddTenderDailyException{
       return Left(AddTenderDailyFailure());
     }on AddTenderMonthlyException{
       return Left(AddTenderMonthlyFailure());
     }
   }else{
     return Left(OfflineFailure());
   }

  }
///
  /// here for get countries
  ///
  @override
  Future<Either<Failure, List<CountriesEntity>>> getCountries() async{
   if(await networkInfo.isConnected){
     try{
       final countries=await addTenderRemoteDataSource.getCountries();
       return Right(countries);

     }on ServerException{
       return Left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for get cities
  ///
  @override
  Future<Either<Failure, List<CityAddTenderEntity>>> getAllCitiesAddTender(int countryId) async{

    if(await networkInfo.isConnected){
      try{

        final cities=await addTenderRemoteDataSource.getAllCitiesAddTender(countryId);
        return Right(cities);


      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure( ));
    }


  }

}