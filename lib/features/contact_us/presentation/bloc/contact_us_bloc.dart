import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/contact_us/domain/entity/contact_us_entity.dart';
import 'package:be_to_be/features/contact_us/domain/usecase/get_contact_us_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  static ContactUsBloc get(context)=>BlocProvider.of(context);

  final GetContactUsUseCase getContactUsUseCase;

  ContactUsEntity? contactUsEntity;



  ContactUsBloc({
    required this.getContactUsUseCase,
}) : super(ContactUsInitial()) {
    on<ContactUsEvent>((event, emit)async {
      if(event is GetContactUsEvent){
        emit(LoadingGetContactUsState());
        final failureOrContactUs=await getContactUsUseCase();
        failureOrContactUs.fold(
                (failure) {
                  emit(ErrorGetContactUsState(error: _mapFailureToMessage(failure)));
                },
                (contactUs) {
                  contactUsEntity=contactUs;
                  emit(LoadedGetContactUsState());
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
