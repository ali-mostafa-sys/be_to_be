

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';
import 'package:be_to_be/features/notification/domain/repositories/notification_repositories.dart';
import 'package:dartz/dartz.dart';

class GetNotificationUseCase{

  final NotificationRepositories notificationRepositories;
      GetNotificationUseCase({
    required this.notificationRepositories
  });

  Future<Either<Failure,List<NotificationEntity>>>call()async{
    return await notificationRepositories.getNotification();
  }
}