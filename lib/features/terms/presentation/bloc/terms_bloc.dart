import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/terms/domain/entity/terms_entity.dart';
import 'package:be_to_be/features/terms/domain/usecase/get_terms_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  static TermsBloc get(context)=> BlocProvider.of(context);

  final GetTermsUseCase getTermsUseCase;

  TermsEntity? termsEntity;


  TermsBloc({
    required this.getTermsUseCase,
}) : super(TermsInitial()) {
    on<TermsEvent>((event, emit)async {
      if(event is GetTermsEvent){
        emit(LoadingTermsState());

        final failureOrTerms=await getTermsUseCase();


        failureOrTerms.fold(
                (failure) {
                  emit(ErrorTermsState(error: _mapFailureToMessage(failure)));
                },
                (terms) {
                  termsEntity=terms;
                  print(termsEntity);
                  emit(LoadedTermsState());

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
