import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/faq/domain/entity/fqa_entity.dart';
import 'package:be_to_be/features/faq/domain/usecase/fqa_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  static FaqBloc get(context)=>BlocProvider.of(context);

  final GetFQAUseCase getFQAUseCase;
   List<FQAEntity> fqaList=[];



  FaqBloc({
    required this.getFQAUseCase,

}) : super(FaqInitial()) {
    on<FaqEvent>((event, emit)async {
      if(event is GetFQAEvent){
        emit(LoadingFQAState());

        final failureOrFQA=await getFQAUseCase();
        failureOrFQA.fold(
                (failure) {
                  emit(ErrorFQAState(error: _mapFailureToMessage(failure)));
                },
                (fqa) {

                  fqa.map((e){
                    fqaList.add(e);
                  }).toList();
                  print(fqaList);


                  emit(LoadedFQAState());

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
