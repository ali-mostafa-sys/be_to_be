

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/history/data/data_source/history_remote_data_source/history_remote_data_source.dart';
import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';
import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';
import 'package:be_to_be/features/history/domain/repositories/hestory_repositories/hestory_repositories.dart';
import 'package:dartz/dartz.dart';

class HistoryRepositoriesImpl implements HistoryRepositories{
  final NetworkInfo networkInfo;
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepositoriesImpl({
   required this.networkInfo,required this.historyRemoteDataSource
});




  ///
  /// here for get tender
  ///
  @override
  Future<Either<Failure, List<TenderHEntity>>> getHistoryTenders()async {
   if(await networkInfo.isConnected){
     try{
       final tenders=await historyRemoteDataSource.getTender();
       return Right(tenders);
     }on ServerException{
       return Left(ServerFailure());
     }on TenderIsEmptyException{
       return left(TenderIsEmptyFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for get order
  ///
  @override
  Future<Either<Failure, List<OrderHEntity>>> getHistoryOrder()async {
    if(await networkInfo.isConnected){
      try{

        final orders=await historyRemoteDataSource.getOrder();
        return Right(orders);

      }on ServerException{
        return Left(ServerFailure());
      }on OrderIsEmptyException{
        return Left(OrderIsEmptyFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }

}