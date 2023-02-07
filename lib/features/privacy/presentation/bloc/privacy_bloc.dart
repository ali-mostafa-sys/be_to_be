import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/privacy/domain/entity/privacy_entity.dart';
import 'package:be_to_be/features/privacy/domain/usecase/get_privacy_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  static PrivacyBloc get(context)=>BlocProvider.of(context);

  final GetPrivacyUseCase getPrivacyUseCase;

  PrivacyEntity? privacyEntity;



  PrivacyBloc({
    required this.getPrivacyUseCase,
}) : super(PrivacyInitial()) {
    on<PrivacyEvent>((event, emit)async{
      if(event is GetPrivacyEvent){
        emit(LoadingPrivacyState());

        final failureOrPrivacy=await getPrivacyUseCase();
        failureOrPrivacy.fold(
                (failure) {

                },
                (privacy) {
                  privacyEntity=privacy;
                  emit(LoadedPrivacyState());

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
      case OrderIsEmptyFailure:
        return orderIsEmptyMessage;
      case MyOfferIsEmptyFailure:
        return myOfferIsEmptyMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
