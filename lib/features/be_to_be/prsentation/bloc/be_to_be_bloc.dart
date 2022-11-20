import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'be_to_be_event.dart';
part 'be_to_be_state.dart';

class BeToBeBloc extends Bloc<BeToBeEvent, BeToBeState> {
  static BeToBeBloc get(context)=>BlocProvider.of(context);
  bool isExpanded =false;


  BeToBeBloc() : super(BeToBeInitial()) {
    on<BeToBeEvent>((event, emit)async {
      ///
      /// here for expanded event
      ///

      if(event is ExpandedEvent){
        isExpanded=event.isExpanded;
        emit(ExpandedState(isExpanded: isExpanded));
      }
      ///
      /// here for get all data event
      ///








    });
  }
}
