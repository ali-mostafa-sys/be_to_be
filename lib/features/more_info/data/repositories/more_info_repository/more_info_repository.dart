

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/more_info/data/data_source/more_info_remote_data_source/more_remote_data_source.dart';
import 'package:be_to_be/features/more_info/domain/entity/offer_owner_info_entity/offer_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/entity/tender_owner_info_entity/tender_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/repositories/more_info_b2b_repositories/more_info_b2b_repositories.dart';
import 'package:dartz/dartz.dart';

class MoreInfoB2BRepositoryImpl implements MoreInfoB2BRepositories{
  final MoreInfoRemoteDataSource moreInfoRemoteDataSource;
  final NetworkInfo networkInfo;
  MoreInfoB2BRepositoryImpl({
    required this.networkInfo,
    required this.moreInfoRemoteDataSource,
});
  ///
  /// here for get tender owner info
  ///
  @override
  Future<Either<Failure, TenderOwnerInfoEntity>> getTenderOwnerInfo(int tenderId)async {
   if(await networkInfo.isConnected){
     try{
       final tenderOwnerInfo=await moreInfoRemoteDataSource.getTenderOwnerInfo(tenderId);
       return Right(tenderOwnerInfo);


     }on ServerException{
       return Left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for get offer owner info
  ///
  @override
  Future<Either<Failure, OfferOwnerInfoEntity>> getOfferOwnerInfo(int offerId)async {
    if(await networkInfo.isConnected){
      try{
        final offerOwnerInfo=await moreInfoRemoteDataSource.getOfferOwnerInfo(offerId);
        return Right(offerOwnerInfo);


      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }
///
  /// here for offer executed
  ///
  @override
  Future<Either<Failure, Unit>> postOfferExecuted(int offerId) async{
    if(await networkInfo.isConnected){
      try{
        await moreInfoRemoteDataSource.getOfferOwnerInfo(offerId);
        return const Right(unit);


      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}