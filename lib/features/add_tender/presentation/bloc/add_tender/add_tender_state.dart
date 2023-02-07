part of 'add_tender_bloc.dart';

abstract class AddTenderState extends Equatable {
  const AddTenderState();
  @override
  List<Object> get props => [];
}

class AddTenderInitial extends AddTenderState {
  @override
  List<Object> get props => [];
}

///
/// here for choose marker address state
///
class ChooseMarkerAddressState extends AddTenderState{
  final String markerAddress;
  const ChooseMarkerAddressState({required this.markerAddress});
  @override
  List<Object> get props => [markerAddress];



}
///
/// here for choose PaymentType state
///
class ChoosePaymentTypeState extends AddTenderState{
  final String paymentType;
  const ChoosePaymentTypeState({required this.paymentType});
  @override
  List<Object> get props => [paymentType];



}

///
/// here for get product list
///
 class LoadingGetProductListState extends AddTenderState{}
 class LoadedGetProductListState extends AddTenderState{}
 class ErrorGetProductListState extends AddTenderState{
  final String error;
  const ErrorGetProductListState({required this.error});
  @override
  List<Object> get props => [error];

 }
///
/// here for selected product
///
class SelectedProductState extends AddTenderState{
  final String product ;
  const SelectedProductState({
    required this.product
});

  @override
  List<Object> get props => [product];
}
///
/// here for get all countries state
///
class LoadingGetAllCountriesState extends AddTenderState{}
class LoadedGetAllCountriesState extends AddTenderState{}
class ErrorGetAllCountriesState extends AddTenderState{
  final String error;
  const ErrorGetAllCountriesState({required this.error});
  @override
  List<Object> get props => [error];
}
///
/// here for selected country
///

class SelectedCountryAddTenderState extends AddTenderState{
  final String country ;
  const SelectedCountryAddTenderState({
    required this.country
  });

  @override
  List<Object> get props => [country];
}
///
/// HERE FOR GAT ALL CITIES STATE
///

class LoadingGetAllCitiesAddTenderState extends AddTenderState{}
class LoadedGetAllCitiesAddTenderState extends AddTenderState{}
class ErrorGetAllCitiesAddTenderState extends AddTenderState{
  final String error;
  const ErrorGetAllCitiesAddTenderState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// here for selected city state
///

class SelectedCityAddTenderState extends AddTenderState{
  final String city ;
  const SelectedCityAddTenderState({
    required this.city
  });

  @override
  List<Object> get props => [city];
}
///
/// here for add tender state
///
class LoadingAddTenderState extends AddTenderState{}
class LoadedAddTenderState extends AddTenderState{}
class ErrorAddTenderState extends AddTenderState{
  final String error;
  const ErrorAddTenderState({required this.error});
  @override
  List<Object> get props => [error];
}


