


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/offers/data/data_source/offer_remote_data_source/offer_remote_data_source.dart';
import 'package:be_to_be/features/offers/domain/entity/cities_entity/cities_offer_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class OfferRepositoriesImpl implements OfferRepositories{

  final OfferRemoteDataSource offerRemoteDataSource;
  final NetworkInfo networkInfo;

  const OfferRepositoriesImpl({
    required this.offerRemoteDataSource,
    required this.networkInfo
});
  ///
  /// here for get all tender
  ///
  @override
  Future<Either<Failure, List<GetAllTenderEntity>>> getAllTender() async{

    if(await networkInfo.isConnected){

      try{
        final listOfTenderEntity=await offerRemoteDataSource.getAllTender();
        return Right(listOfTenderEntity);
      }on ServerException{
        return Left(ServerFailure());
      }on TenderIsEmptyException{
        return Left(TenderIsEmptyFailure());
      }

    }else{
      return Left(OfflineFailure());
    }


  }
///
  /// here for get all offers on tender
  ///
  @override
  Future<Either<Failure, List<GetAllOfferOnTenderEntity>>> getAllOffersOnTender(int tenderId)async {
    if(await networkInfo.isConnected){
      try{
        final listOfOffersEntity=await offerRemoteDataSource.getAllOffers(tenderId);
        return Right(listOfOffersEntity);
      }on ServerException{
        return Left(ServerFailure());
      }on OffersIsEmptyException{
        return Left(OffersIsEmptyFailure());
      }

    }else{
      return Left(OfflineFailure());
    }

    // TODO: implement getAllOffersOnTender
    throw UnimplementedError();
  }
///
  /// here for delete offer
  ///
  @override
  Future<Either<Failure, Unit>> deleteOffer(int offerId)async {
   if(await networkInfo.isConnected){
     try{
       await offerRemoteDataSource.deleteOffer(offerId);
       return const Right(unit);

     }on ServerException{
       return Left(ServerFailure( ));
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for get cities
  ///
  @override
  Future<Either<Failure, List<CitiesOfferEntity>>> getOfferCities() async{
   if(await networkInfo.isConnected){
     try{
       final cities=await offerRemoteDataSource.getCitiesOffer();
       return Right(cities);



     }on ServerException{
       return Left(ServerFailure());
     }

   }else{
     return Left(OfflineFailure(  ));
   }
  }
///
  /// here for accepted offer
  ///
  @override
  Future<Either<Failure, Unit>> postAcceptOffer(int offerId) async{
    if(await networkInfo.isConnected){
      try{
        await offerRemoteDataSource.postAcceptOffer(offerId);
        return const Right(unit);


      }on ServerException{
        return Left(ServerFailure());
      }



    }else{
      return Left(OfflineFailure( ));
    }
  }
}