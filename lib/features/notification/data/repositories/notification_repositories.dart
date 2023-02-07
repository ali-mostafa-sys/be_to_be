

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/notification/data/data_source/notification_remote_data_source/notification_remote_data_source.dart';
import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';
import 'package:be_to_be/features/notification/domain/repositories/notification_repositories.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoriesImpl implements NotificationRepositories{
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final NetworkInfo networkInfo;
  const NotificationRepositoriesImpl({
    required this.networkInfo,
    required this.notificationRemoteDataSource,
});





  ///
  /// here for get notifications
  ///
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotification()async {
   if(await networkInfo.isConnected){
     try{
       final notifications=await notificationRemoteDataSource.getNotification();
       return Right(notifications);
     }on ServerException{
       return Left(ServerFailure());
     }on NotificationIsEmptyException{
       return Left(NotificationIsEmptyFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for read notification
  ///
  @override
  Future<Either<Failure, Unit>> postReadNotification(int notificationId)async {
  // int notification=notificationId;
   if(await networkInfo.isConnected){
     try{
       await notificationRemoteDataSource.postRearNotification(notificationId);
       return const  Right(unit);


     }on ServerException{
       return Left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }



  }




}