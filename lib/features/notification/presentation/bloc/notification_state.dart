part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

///
/// here for get notifications state
///

class LoadingGetNotificationState extends NotificationState{}
class LoadedGetNotificationState extends NotificationState{}
class ErrorGetNotificationState extends NotificationState{
  final String error;
  const ErrorGetNotificationState({
    required this.error
});
  @override
  List<Object> get props => [error];
}
///
/// here for read notification
///
class LoadingReadState extends NotificationState{}
class LoadedReadState extends NotificationState{
 final List<NotificationEntity> notificationList;
  final int index;
  const LoadedReadState({

    required this.index,
    required this.notificationList,
  });
  @override
  List<Object> get props => [index,notificationList];
}
class ErrorReadState extends NotificationState{
  final String error;
  const ErrorReadState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}









