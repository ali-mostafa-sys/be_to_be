import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/order/domain/entity/my_offer_entity/mu_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/domain/usecase/delete_offer_usecase/delete_offer_order_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/get_mu_offr_usecase/get_my_offer_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/get_orders_usecase/gat_orders_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/post_add_offer_usecase/post_add_offer_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  static OrderBloc get(context) => BlocProvider.of(context);
  final GetOrdersUseCase getOrdersUseCase;
  final PostAddOfferUseCase postAddOfferUseCase;
  final GetMyOfferUseCase getMyOfferUseCase;
  final DeleteOfferOrderUseCase deleteOfferOrderUseCase;

  List<bool> isPop = [];
  List<bool> onExpanded = [];
  List<bool> isIncludeDelivery = [];
  List<bool> isIncludeTax = [];
  List<GetOrderEntity> orderedList = [];
  List<String> deliveryTimePeriod = [];
  List<String> maxTenderPeriod = [];
  DateTime? from;
  DateTime? to;
  String? deliveryBefore;
  String? maxTenderPeriodItem;

  // int itemCount=4;
  /// here for sort
  String sortValue = 'ali';

  /// here for loading widget
  List<bool> loadingWidget = [];
  MyOfferEntity? myOfferEntity;

  OrderBloc({
    required this.getOrdersUseCase,
    required this.postAddOfferUseCase,
    required this.getMyOfferUseCase,
    required this.deleteOfferOrderUseCase,
  }) : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      // if(event is IntEvent){
      //   for(int i=0;i<=itemCount-1;i++){
      //     onExpanded.add(false);
      //     isPop.add(false);
      //   }
      //   emit(IntState());
      // }

      if (event is GetMyOfferEvent) {
        loadingWidget[event.index] = true;
        emit(LoadingGetMyOfferState());

        final failureOrMyOffer = await getMyOfferUseCase(
            creatByUserId: event.userId, tenderId: event.tenderId);
        failureOrMyOffer.fold((failure) {
          loadingWidget[event.index] = false;
          onExpanded[event.index] = !onExpanded[event.index];
          emit(ErrorGetMyOfferState(error: _mapFailureToMessage(failure)));
        }, (myOffer) {
          print(myOffer);
          if (myOffer.status == 'PENDING') {
            myOfferEntity = myOffer;
          }

          loadingWidget[event.index] = false;

          for (int i = 0; i < onExpanded.length; i++) {
            if (i == event.index) {
              onExpanded[i] = !onExpanded[i];
            } else {
              onExpanded[i] = false;
            }
          }

          //onExpanded[event.index]= !onExpanded[event.index];
          emit(LoadedGetMyOfferState(isExpanded: onExpanded[event.index]));
        });

        // onExpanded[event.index]= !onExpanded[event.index];
        // emit(IsExpandedState(isExpanded:onExpanded[event.index] ));
      }

      ///
      /// here for get all order event
      ///
      if (event is GetAllOrderEvent) {
        List<GetOrderEntity> orderListSort = [];
        emit(LoadingGetAllOrderState());

        final failureOrGatOrders = await getOrdersUseCase();
        failureOrGatOrders.fold((failure) {
          emit(ErrorGetAllOrderState(error: _mapFailureToMessage(failure)));
        }, (getOrders) {
          print('==========================================================');
          orderListSort = [];
          orderedList = [];
          deliveryTimePeriod = [];
          maxTenderPeriod = [];
          onExpanded = [];
          isPop = [];
          isIncludeDelivery = [];
          isIncludeTax = [];
          loadingWidget = [];

          if (event.sortValue != 'ali') {
            print(event.sortValue);
            // orderListSort=[];
            // orderedList=[];
            // deliveryTimePeriod=[];
            // maxTenderPeriod=[];
            // onExpanded=[];
            // isPop=[];
            // isIncludeDelivery=[];
            // isIncludeTax=[];
            // loadingWidget=[];
            orderListSort = _sortButton(event.sortValue, getOrders);
          } else {
            orderListSort = [];
            orderListSort = getOrders;
          }
          print(getOrders);

          for (int i = 0; i <= orderListSort.length - 1; i++) {
            ///here for status cheek
            if (orderListSort[i].status == 'OPENED') {
              deliveryBefore = DateTime.parse(orderListSort[i].deliverBefore)
                  .difference(DateTime.now())
                  .inDays
                  .toString();
              deliveryTimePeriod.add(deliveryBefore!);
              from = DateTime.parse(orderListSort[i].from);
              to = DateTime.parse(orderListSort[i].to);
              maxTenderPeriodItem = to!.difference(from!).inDays.toString();
              maxTenderPeriod.add(maxTenderPeriodItem!);
              onExpanded.add(false);
              isPop.add(false);
              isIncludeDelivery.add(false);
              isIncludeTax.add(false);
              loadingWidget.add(false);
              orderedList.add(orderListSort[i]);
            }
          }
          //print(orderedList[0]);
          emit(LoadedGetAllOrderState());
        });
      }

      ///
      /// here for show dialog
      ///
      if (event is OnShowDialogEvent) {
        isPop[event.index] = !isPop[event.index];
        print(orderedList[event.index].tenderId);
        print(isPop[event.index]);
        emit(OnShowDialogState(
            isPop: isPop[event.index],
            index: event.index,
            tenderId: orderedList[event.index].tenderId,
            orderList: orderedList[event.index]));
      }

      ///
      /// here for include delivery event
      ///
      if (event is IncludeDeliverySwitchButtonEvent) {
        emit(IncludeDeliverySwitchButtonState(isInclude: event.isInclude));
      }

      ///
      /// here for include tax event
      ///
      if (event is IncludeTaxSwitchButtonEvent) {
        emit(IncludeTaxSwitchButtonState(isInclude: event.isInclude));
      }

      ///
      /// here for total price event
      ///
      if (event is TotalPriceEvent) {
        if (event.vat != null) {
          final itemsPrice = event.quantity * event.pricePerItem;
          final price = itemsPrice * event.vat!;
          final percent = price / 100;

          final totalPrice = itemsPrice + percent;
          emit(TotalPriceState(totalPrice: totalPrice));
        } else {
          final allPrice = event.quantity * event.pricePerItem;
          emit(TotalPriceState(totalPrice: allPrice));
        }
      }

      ///
      /// her for add offer event
      ///
      if (event is AddOfferEvent) {
        emit(LoadingAddOfferState());

        final failureOrAddedOffer =
            await postAddOfferUseCase(event.addOfferEntity);
        failureOrAddedOffer.fold(
          (failure) {
            emit(ErrorAddOfferState(error: _mapFailureToMessage(failure)));
          },
          (addedOffer) {
            emit(LoadedAddOfferState());
          },
        );
      }

      ///
      /// delete offer
      ///
      if (event is DeleteOfferOrderEvent) {
        emit(LoadingDeleteOfferOrderState());

        final failureOrDeletedOffer =
            await deleteOfferOrderUseCase(event.offerId);
        failureOrDeletedOffer.fold((failure) {
          emit(
              ErrorDeleteOfferOrderState(error: _mapFailureToMessage(failure)));
        }, (deletedOffer) {
          emit(LoadedDeleteOfferOrderState());
        });
      }
    });
  }

  List<GetOrderEntity> _sortButton(
      String sortValue, List<GetOrderEntity> list) {
    switch (sortValue) {

      /// here i dont have rate
      case "Rate":
        return list..sort((a, b) => a.creatorScore.compareTo(b.creatorScore));

      case "Quantity":
        return list..sort((a, b) => a.quantity.compareTo(b.quantity));
      case "Latest Time":
        return list..sort((a, b) => a.deliverBefore.compareTo(b.deliverBefore));

      /// here i do no have price
      case "Price":
        return list..sort((a, b) => a.categoryName.compareTo(b.categoryName));
      case "Include Delivery":
        return list..sort((a, b) => a.area!.compareTo(b.area!));
      default:
        return list..sort((a, b) => a.quantity.compareTo(b.quantity));
    }
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
