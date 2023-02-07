part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
  @override
  List<Object> get props => [];
}

///
/// here for get notification event
///
class GetNotificationEvent extends NotificationEvent{}
///
/// here for read notification
///
class ReadNotificationEvent extends NotificationEvent{
  final int notificationsIds;
  final int index;
  const ReadNotificationEvent({
    required this.notificationsIds,
    required this.index,
});
  @override
  List<Object> get props => [notificationsIds,index];
}




