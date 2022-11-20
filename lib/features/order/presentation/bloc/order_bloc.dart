import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/domain/usecase/get_orders_usecase/gat_orders_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/post_add_offer_usecase/post_add_offer_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  static OrderBloc get(context)=>BlocProvider.of(context);
  final GetOrdersUseCase getOrdersUseCase;
  final PostAddOfferUseCase postAddOfferUseCase;

 List<bool> isPop=[];
 List <bool> onExpanded=[];
 List<bool>isIncludeDelivery=[];
 List<bool>isIncludeTax=[];
 List<GetOrderEntity> orderedList=[];
 int itemCount=4;




  OrderBloc({
    required this.getOrdersUseCase,
    required this.postAddOfferUseCase,
}) : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async{

      // if(event is IntEvent){
      //   for(int i=0;i<=itemCount-1;i++){
      //     onExpanded.add(false);
      //     isPop.add(false);
      //   }
      //   emit(IntState());
      // }

      if(event is IsExpandedEvent){

        onExpanded[event.index]= !onExpanded[event.index];
        emit(IsExpandedState(isExpanded:onExpanded[event.index] ));
      }
      ///
      /// here for get all order event
      ///
      if(event is GetAllOrderEvent){
        emit(LoadingGetAllOrderState());

        final failureOrGatOrders= await getOrdersUseCase();
        failureOrGatOrders.fold(
                (failure) {
                  emit(ErrorGetAllOrderState(error: _mapFailureToMessage(failure)));
                },
                (getOrders) {
                  for(int i=0;i<=getOrders.length-1;i++){
                    onExpanded.add(false);
                    isPop.add(false);
                    isIncludeDelivery.add(false);
                    isIncludeTax.add(false);
                    orderedList.add(getOrders[i]);
                  }
                  print(orderedList[0]);
                  emit(LoadedGetAllOrderState());
            });
      }
      ///
      /// here for show dialog
      ///
      if(event is OnShowDialogEvent){
        isPop[event.index]=!isPop[event.index];
        print(orderedList[event.index].tenderId);
        print(isPop[event.index]);
        emit(OnShowDialogState(isPop: isPop[event.index],index: event.index,tenderId: orderedList[event.index].tenderId ));
      }
      ///
      /// here for include delivery event
      ///
      if(event is IncludeDeliverySwitchButtonEvent){
        emit(IncludeDeliverySwitchButtonState(isInclude: event.isInclude));
      }
      ///
      /// here for include tax event
      ///
        if(event is IncludeTaxSwitchButtonEvent){
          emit(IncludeTaxSwitchButtonState(isInclude: event.isInclude));
        }
        ///
      /// here for total price event
      ///
     if(event is TotalPriceEvent){
       if(event.vat!=null){
         final itemsPrice=event.quantity*event.pricePerItem;
         final price= itemsPrice*event.vat!;
         final percent=price/100;

         final totalPrice=itemsPrice+percent;
         emit(TotalPriceState(totalPrice: totalPrice));
       }else{
         final allPrice=event.quantity*event.pricePerItem;
         emit(TotalPriceState(totalPrice: allPrice));
       }


      }
     ///
      /// her for add offer event
      ///
      if(event is AddOfferEvent){
        emit(LoadingAddOfferState());

        final failureOrAddedOffer=await postAddOfferUseCase(event.addOfferEntity);
        failureOrAddedOffer.fold(
                (failure) {
                  emit (ErrorAddOfferState(error: _mapFailureToMessage(failure)));

            },
                (addedOffer) {
                  emit(LoadedAddOfferState());

                },);


      }




    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
