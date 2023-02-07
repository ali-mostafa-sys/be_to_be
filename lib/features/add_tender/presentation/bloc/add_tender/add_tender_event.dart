part of 'add_tender_bloc.dart';

abstract class AddTenderEvent extends Equatable {
  const AddTenderEvent();

  @override
  List<Object> get props => [];
}

///
/// here for choose marker address event
///
class ChooseMarkerAddressEvent extends AddTenderEvent {
  final String markerAddress;

  const ChooseMarkerAddressEvent({required this.markerAddress});

  @override
  List<Object> get props => [markerAddress];
}

///
/// here for choose PaymentType event
///
class ChoosePaymentTypeEvent extends AddTenderEvent {
  final String paymentType;

  const ChoosePaymentTypeEvent({required this.paymentType});

  @override
  List<Object> get props => [paymentType];
}

///
/// here for get  product list
///
class GetProductListEvent extends AddTenderEvent {}

///
/// here for selected product
///
class SelectedProductEvent extends AddTenderEvent {
  final String product;

  const SelectedProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

///
/// here for get countries event
///
class GetAllCountriesAddTenderEvent extends AddTenderEvent {}

///
/// here for selected country
///
class SelectedCountryAddTenderEvent extends AddTenderEvent {
  final String country;

  const SelectedCountryAddTenderEvent({required this.country});

  @override
  List<Object> get props => [country];
}

///
/// here for get all cities event
///

class GetAllCitiesAddTenderEvent extends AddTenderEvent {}

///
/// here for selected city event
///
class SelectedCityAddTenderEvent extends AddTenderEvent {
  final String city;

  const SelectedCityAddTenderEvent({required this.city});

  @override
  List<Object> get props => [city];
}

///
/// here for add tender event
///

class PostAddTenderEvent extends AddTenderEvent{
  final AddTenderEntity addTenderEntity;
  const PostAddTenderEvent({required this.addTenderEntity});
  @override
  List<Object> get props => [addTenderEntity];
}
