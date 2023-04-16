import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';
import 'package:be_to_be/features/notification/domain/usecse/get_notification/get_notification_usecase.dart';
import 'package:be_to_be/features/notification/domain/usecse/post_read_notification_usecase/post_read_notification_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  static NotificationBloc get(context)=>BlocProvider.of(context);

  final GetNotificationUseCase getNotificationUseCase;
  final PostReadNotificationUseCase postReadNotificationUseCase;

  List<NotificationEntity> notificationList=[];



  NotificationBloc({
    required this.getNotificationUseCase,
    required this.postReadNotificationUseCase,
}) : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit)async {
      ///
      /// here for get notification
      ///
      if(event is GetNotificationEvent){

        emit(LoadingGetNotificationState());

        final failureOrGetNotification=await getNotificationUseCase();
        failureOrGetNotification.fold(
                (failure) {
                  emit(ErrorGetNotificationState(error: _mapFailureToMessage(failure)));
            },
                (notification) {
                  notificationList=notification;
                  print(notificationList);
                  emit(LoadedGetNotificationState(notificationList: notificationList));
                }
        );




      }

      ///
      /// here for read notifications
      ///
      if(event is ReadNotificationEvent){
        emit(LoadingReadState());
        final failureOrRead=await postReadNotificationUseCase(event.notificationsIds);
        failureOrRead.fold(
                (failure) {

                  emit(ErrorReadState(error: _mapFailureToMessage(failure)));
                },
                (read) {
                  emit(LoadedReadState(index: event.index,notificationList: notificationList));
            });
      }


    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      case NotificationIsEmptyFailure:
        return notificationIsEmptyMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
