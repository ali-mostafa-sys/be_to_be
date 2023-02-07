import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/about_us/domain/entity/about_us_entity.dart';
import 'package:be_to_be/features/about_us/domain/usecase/get_about_us_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  static AboutUsBloc get(context )=>BlocProvider.of(context);

  final GetAboutUsUseCase getAboutUsUseCase;

  AboutUsEntity? aboutUsList;


  AboutUsBloc({
    required this.getAboutUsUseCase,
}) : super(AboutUsInitial()) {
    on<AboutUsEvent>((event, emit)async {
      ///
      /// here for get about us event
      ///
   if(event is GetAboutUsEvent){
     emit(LoadingGetAboutUsState());
     final failureOrGetAboutUs=await getAboutUsUseCase();
     failureOrGetAboutUs.fold(
             (failure) {
               emit(ErrorGetAboutUsState(error: _mapFailureToMessage(failure)));
             },
               (aboutUs) {
               aboutUsList=aboutUs[0];
                 // aboutUs.map((e) {
                 //   aboutUsList.add(e);
                 // }).toList();

                 emit(LoadedGetAboutUsState());

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
