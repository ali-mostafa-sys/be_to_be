

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/notification/domain/repositories/notification_repositories.dart';
import 'package:dartz/dartz.dart';

class PostReadNotificationUseCase{
  final NotificationRepositories notificationRepositories;
  const PostReadNotificationUseCase({
    required this.notificationRepositories
});

  Future<Either<Failure,Unit>>call(int notificationId)async{
    return await notificationRepositories.postReadNotification(notificationId);
  }
}