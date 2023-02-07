part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}


class IsExpandedEvent extends OrderEvent{
  final int index;
  const IsExpandedEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class IntEvent extends OrderEvent{}
///
/// here for get all order event
///

class GetAllOrderEvent extends OrderEvent{
  final String sortValue;
  const GetAllOrderEvent({required this.sortValue});
  @override
  List<Object> get props => [sortValue];
}
///
/// here for show dialog event
///
class OnShowDialogEvent extends OrderEvent{
  final int index;
  const OnShowDialogEvent({required this.index});
  @override
  List<Object> get props => [index];
}
///
/// here for include delivery switch button
///
class IncludeDeliverySwitchButtonEvent extends OrderEvent{
  final bool isInclude;
 const IncludeDeliverySwitchButtonEvent({required this.isInclude});
  @override
  List<Object> get props => [isInclude];
}
///
/// here for include tax switch button
///

class IncludeTaxSwitchButtonEvent extends OrderEvent{
  final bool isInclude;
  const IncludeTaxSwitchButtonEvent({required this.isInclude});
  @override
  List<Object> get props => [isInclude];
}
///
/// here for total price
///
class TotalPriceEvent extends OrderEvent{
  final double? vat;
  final int quantity;
  final double pricePerItem;
  const TotalPriceEvent({this.vat,required this.quantity,required this.pricePerItem});
  @override
  List<Object> get props => [vat!,quantity,pricePerItem];

}

///
/// here for add offer event
///
class AddOfferEvent extends OrderEvent{
  final AddOfferEntity addOfferEntity;

  const AddOfferEvent({required this.addOfferEntity});
  @override
  List<Object> get props => [addOfferEntity];

}

///
/// HERE FOR SORT STATE
///

class SortOrderEvent extends OrderEvent{
  final String sortValue;
  const SortOrderEvent({required this.sortValue});
  @override
  List<Object> get props => [sortValue];
}

///
/// here for get my offer event
///
class GetMyOfferEvent extends OrderEvent{
  final int tenderId;
  final int userId;
  final int index;

  const GetMyOfferEvent({
    required this.tenderId,
    required this.userId,
    required this.index,
});
  @override
  List<Object> get props => [tenderId,userId,index];


}
///
/// delete offer event
///

class DeleteOfferOrderEvent extends  OrderEvent{
  final int offerId;
  const DeleteOfferOrderEvent({
    required this.offerId
});
  @override
  List<Object> get props => [offerId];
}














