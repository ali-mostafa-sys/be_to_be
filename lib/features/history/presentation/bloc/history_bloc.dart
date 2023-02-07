import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';
import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';
import 'package:be_to_be/features/history/domain/usecase/get_order_h_usecase/get_order_h_usecase.dart';
import 'package:be_to_be/features/history/domain/usecase/get_tender_h_usecase/get_tender_h_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  static HistoryBloc get(context)=>BlocProvider.of(context  );
  final GetTenderHUseCase getTenderHUseCase;
  final GetOrderHUseCase getOrderHUseCase;


  String isOrder='order';
  List<TenderHEntity>tenderList=[];
  List<OrderHEntity>orderList=[];





  HistoryBloc({
    required this.getTenderHUseCase,
    required this.getOrderHUseCase,

}) : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit)async {
      ///
      /// here for order or tender event
      ///
  if(event is TenderOrOrderEvent){
    isOrder=event.isOrder;
    emit(TenderOrOrderState(isOrder: isOrder));
  }
  ///
      /// here for get tenders
      ///
  if(event is GetTenderHEvent){
    emit(LoadingGetTenderHState());

    final failureOrDetTender=await getTenderHUseCase();
    failureOrDetTender.fold(
            (failure) {
              emit(ErrorGetTenderHState(error: _mapFailureToMessage(failure)));

            },
            (tenders) {
              tenderList=[];

              tenders.map((e) {
                if(e.status=='CLOSED'){
                  tenderList.add(e);
                }

              }).toList();
              emit(LoadedGetTenderHState(tenderList:tenderList));

            });
  }
  ///
      /// here for get orders
      ///

      if(event is GetOrdersHEvent){

        emit(LoadingGetOrdersHState());

        final failureOrGetOrders=await getOrderHUseCase();
        failureOrGetOrders.fold(
                (failure) {
                  emit(ErrorGetOrdersHState(error: _mapFailureToMessage(failure)));

                },
                (orders) {
                  orderList=[];

                  orders.map((e) {
                    if(e.status!='PENDING'){
                      orderList.add(e);
                    }
                  }).toList();
                  print(orderList);
                  emit(LoadedGetOrdersHState(orderList: orderList));

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
        return orderHistoryIsEmptyMessage;
      case TenderIsEmptyFailure:
        return tenderHistoryIsEmptyMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
