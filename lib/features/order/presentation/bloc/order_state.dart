part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}




class IsExpandedState extends OrderState{
final bool isExpanded;
const IsExpandedState({required this.isExpanded});
  @override
  List<Object> get props => [isExpanded];
}

class IntState extends OrderState{}

///
/// her for get all order state
///

class LoadingGetAllOrderState extends OrderState{}
class LoadedGetAllOrderState extends OrderState{}
class ErrorGetAllOrderState extends OrderState{
  final String error;
  const ErrorGetAllOrderState({required this.error});
  @override
  List<Object> get props => [error];
}
///
/// here for show dialog state ////////////////
///

class OnShowDialogState extends OrderState{
  final bool isPop;
  final int index;
  final int tenderId;
  final GetOrderEntity orderList;
  const OnShowDialogState({required this.isPop,required this.index,required this.tenderId,required this.orderList});
  @override
  List<Object> get props => [isPop,orderList];
}

///
/// here for include delivery switch button
///
class IncludeDeliverySwitchButtonState extends OrderState{
  final bool isInclude;
  const IncludeDeliverySwitchButtonState({required this.isInclude});
  @override
  List<Object> get props => [isInclude];
}
///
/// here for include tax switch button
///

class IncludeTaxSwitchButtonState extends OrderState{
  final bool isInclude;
  const IncludeTaxSwitchButtonState({required this.isInclude});
  @override
  List<Object> get props => [isInclude];
}
///
/// here for total price
///

class TotalPriceState extends OrderState{
  final double totalPrice;
  const TotalPriceState({required this.totalPrice});
  @override
  List<Object> get props => [totalPrice];
}
///
/// here for add offer state
///
class LoadingAddOfferState extends OrderState{}
class LoadedAddOfferState extends OrderState{}
class ErrorAddOfferState extends OrderState{
  final String error;
  const ErrorAddOfferState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// HERE FOR SORT STATE
///

class SortOrderState extends OrderState{
  final String sortValue;
  const SortOrderState({required this.sortValue});
  @override
  List<Object> get props => [sortValue];
}

///
/// here for get my offer state
///
class LoadingGetMyOfferState extends OrderState{}
class LoadedGetMyOfferState extends OrderState{
  final bool isExpanded;
  const LoadedGetMyOfferState({
    required this.isExpanded,
  });
  @override
  List<Object> get props => [isExpanded];
}
class ErrorGetMyOfferState extends OrderState{
  final String error;
  const ErrorGetMyOfferState({required this.error});
  @override
  List<Object> get props => [error];
}

class LoadingDeleteOfferOrderState extends OrderState{}
class LoadedDeleteOfferOrderState extends OrderState{}
class ErrorDeleteOfferOrderState extends OrderState{
  final String error;
  const ErrorDeleteOfferOrderState({required this.error});

  @override
  List<Object> get props => [error];

}







