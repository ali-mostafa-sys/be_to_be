import 'dart:async';
import 'dart:convert';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/offers_on_tender_b2b_entity/offer_on_tender_b2b_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/use_case/get_be_to_be_data/get_be_tobe_data.dart';
import 'package:be_to_be/features/be_to_be/domain/use_case/get_offers_on_tender_b2b_usecase/get_offers_on_tender_b2b_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'be_to_be_event.dart';

part 'be_to_be_state.dart';

class BeToBeBloc extends Bloc<BeToBeEvent, BeToBeState> {
  static BeToBeBloc get(context) => BlocProvider.of(context);
  final GetBeToBeData getBeToBeData;
  final GetOffersOnTenderB2BUseCase getOffersOnTenderB2BUseCase;
  final SharedPreferences sharedPreferences;



  List<bool> isExpanded = [];
  List<bool>loading=[];
  List<BeToBeEntity> dataList = [];


  /// here for delivered
  bool isDelivered = false;
  bool isPending = true;
  /// here for offers on tender
List<OffersOnTendersB2BEntity> offersList=[];




  BeToBeBloc({
    required this.getBeToBeData,
    required this.getOffersOnTenderB2BUseCase,
    required this.sharedPreferences,
  }) : super(BeToBeInitial()) {
    on<BeToBeEvent>((event, emit) async {
      ///
      /// here for expanded event
      ///

      if (event is ExpandedEvent) {
        loading[event.index]=true;
        emit(LoadingGetOffersOnTenderState());
        final failureOrOffers=await getOffersOnTenderB2BUseCase(tenderId: event.tenderId,isExecuted: event.isExecuted);
        failureOrOffers.fold(
                (failure) {
                  loading[event.index]=false;
                  emit(ErrorGetOffersOnTenderState(error: _mapFailureToMessage(failure)));
                },
                (offers) {
                  offersList=[];
                  loading[event.index]=false;
                  offers.map((e) {
                    offersList.add(e);
                  }).toList();

                  for (int i = 0; i < isExpanded.length; i++) {
                    if (event.index == i) {
                      isExpanded[i] = !isExpanded[i] ;
                    } else {
                      isExpanded[i] = false;
                    }
                  }
                  print('here');
                  print(event.index);
                  print(isExpanded[event.index]);
                  print(isExpanded);

                  emit(ExpandedState(isExpanded: isExpanded[event.index]));
            });





      }

      ///
      /// here for get all data event
      ///

      if (event is GetAllDataEvent) {
        emit(LoadingGetALLdDataState());
        final failureOrGetData = await getBeToBeData(event.isPending);
        failureOrGetData.fold((failure) {
          emit(ErrorGetALLdDataState(error: _mapFailureToMessage(failure)));
        }, (data) {
          dataList = [];
          isExpanded = [];
          loading = [];

          data.map((e) {
            dataList.add(e);
            isExpanded.add(false);
            loading.add(false);
          }).toList();
          emit(LoadedGetALLdDataState());
        });
      }

      ///
      /// here for is delivered event
      ///
      if(event is IsDeliveredEvent){
        isDelivered=event.isDelivered;
        isPending=event.isPending;
        emit(IsDeliveredState(isDelivered: isDelivered, isPending: isPending));
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
      case OffersOnTenderB2BIsEmptyFailure:
        return 'There is no Offers';

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
