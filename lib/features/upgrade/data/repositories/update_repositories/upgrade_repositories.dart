

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/upgrade/data/data_source/upgrade_remote_data_source/upgrade_remote_data_source.dart';
import 'package:be_to_be/features/upgrade/data/models/subscribe_model/subscribe_model.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:be_to_be/features/upgrade/domain/repositories/upgrae_repositories/upgrade_reposirories.dart';
import 'package:dartz/dartz.dart';

class UpgradeRepositoriesImpl implements UpgradeRepositories{

  final UpgradeRemoteDataSource upgradeRemoteDataSource;
  final NetworkInfo networkInfo;
  const UpgradeRepositoriesImpl({
    required this.upgradeRemoteDataSource,
    required this.networkInfo,
});

  ///
  /// here for get all package
  ///
  @override
  Future<Either<Failure, List<UpgradeEntity>>> getAllPackages()async {

    if(await networkInfo.isConnected){
      try{
        final listOfUpgradeEntity=await upgradeRemoteDataSource.getAllPackage();
        return Right(listOfUpgradeEntity);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }

  }
///
  /// here for post subscribe
  ///
  @override
  Future<Either<Failure, int>> postSubscribe(SubscribeEntity subscribeEntity)async {
   final subscribeModel=SubscribeModel(
       subscriptionPackageId:subscribeEntity. subscriptionPackageId,promotionCode: subscribeEntity.promotionCode
   );

   if(await networkInfo.isConnected){
     try{
     final subscriptionId=  await upgradeRemoteDataSource.postSubscribe(subscribeModel);
       return  Right(subscriptionId);

     }on ServerException{
       return Left(ServerFailure( ));
     }
   }else{
     return Left(OfflineFailure());
   }




  }


}