import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/use_case/get_be_to_be_data/get_be_tobe_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'be_to_be_event.dart';
part 'be_to_be_state.dart';

class BeToBeBloc extends Bloc<BeToBeEvent, BeToBeState> {
  static BeToBeBloc get(context)=>BlocProvider.of(context);
  final GetBeToBeData getBeToBeData;

 List <bool> isExpanded =[];
  List<BeToBeEntity>dataList=[];


  BeToBeBloc({
    required this.getBeToBeData,

}) : super(BeToBeInitial()) {
    on<BeToBeEvent>((event, emit)async {
      ///
      /// here for expanded event
      ///

      if(event is ExpandedEvent){
       for(int i=0;i<isExpanded.length;i++){
         if(event.index==i){
           isExpanded[event.index]=true;
         }else{
           isExpanded[event.index]=false;
         }
       }
       emit(ExpandedState(isExpanded: isExpanded[event.index]));



        // isExpanded[event.index]=!isExpanded[event.index];
        // emit(ExpandedState(isExpanded: isExpanded[event.index]));
      }
      ///
      /// here for get all data event
      ///

if(event is GetAllDataEvent){
  emit(LoadingGetALLdDataState());
  final failureOrGetData=await getBeToBeData();
  failureOrGetData.fold(
          (failure) {
            emit(ErrorGetALLdDataState(error: _mapFailureToMessage(failure)));

          },
          (data) {
            dataList=[];
            isExpanded=[];
            data.map((e) {
              dataList.add(e);
              isExpanded.add(false);
            }).toList();
            emit(LoadedGetALLdDataState());

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
      case TenderIsEmptyFailure:
        return b2bHistoryIsEmptyMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
