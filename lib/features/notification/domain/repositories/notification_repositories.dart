


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepositories{

  Future<Either<Failure,List<NotificationEntity>>>getNotification();
  Future<Either<Failure,Unit>>postReadNotification(int notificationId);


}