part of 'company_information_bloc.dart';

abstract class CompanyInformationState extends Equatable {
  const CompanyInformationState();
  @override
  List<Object> get props => [];
}

class CompanyInformationInitial extends CompanyInformationState {
  @override
  List<Object> get props => [];
}
/// here for get all company types data /////////////////////////////////
class LoadingGetCompanyTypeState extends CompanyInformationState{}

class LoadedGetCompanyTypeState extends CompanyInformationState{}

class ErrorGetCompanyTypeState extends CompanyInformationState{
  final String error;
  const ErrorGetCompanyTypeState({required this.error});
  @override
  List<Object> get props => [error];
}
///m here for get all counties
class LoadingGetCountiesState extends CompanyInformationState{}

class LoadedGetCountiesState extends CompanyInformationState{
  final int? countryId;
  const LoadedGetCountiesState({
    required this.countryId
});
  @override
  List<Object> get props => [countryId!];
}

class ErrorGetCountiesState extends CompanyInformationState{
  final String error;
  const ErrorGetCountiesState({required this.error});
  @override
  List<Object> get props => [error];
}
/// here for get all cities state

class LoadingGetCitiesState extends CompanyInformationState{}

class LoadedGetCitiesState extends CompanyInformationState{
  final String cityName;
  const LoadedGetCitiesState({required this.cityName});
  @override
  List<Object> get props => [cityName];

}

class ErrorGetCitiesState extends CompanyInformationState{
  final String error;
  const ErrorGetCitiesState({required this.error});
  @override
  List<Object> get props => [error];
}



/// here for drop company down button selected/////////////////////

class SelectedValueForDropDownButtonState extends CompanyInformationState{

  final String selectedValue;
  const SelectedValueForDropDownButtonState({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];

}
/// here for drop countries down button selected/////////////////////

class SelectedValueForCountriesDropDownButtonState extends CompanyInformationState{

  final String selectedValue;
  const SelectedValueForCountriesDropDownButtonState({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];

}
/// here for drop cities down button selected/////////////////////

class SelectedValueForCitiesDropDownButtonState extends CompanyInformationState{

  final String selectedValue;
  const SelectedValueForCitiesDropDownButtonState({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];

}

/// here for pick license image ///////////////////////////

class PickImageForLicenseState extends CompanyInformationState{}
class ErrorPickImageForLicenseState extends CompanyInformationState{}
class DeleteLicenseImageState extends CompanyInformationState{}

/// her for get current location for user /////////////////

class LoadingGetCurrentLocationState extends CompanyInformationState{}
class GetCurrentLocationState extends CompanyInformationState{}
class ErrorGetCurrentLocationState extends CompanyInformationState{}

/// here for choose location of company

class ChooseLocationOfCompanyState extends CompanyInformationState{
  final LatLng latLng;
  const ChooseLocationOfCompanyState({required this.latLng});
  @override
  List<Object> get props => [latLng];
}
/// here for get location info
class LoadingGetCompanyInfoState extends CompanyInformationState{}
class LoadedGetCompanyInfoState extends CompanyInformationState{}
class ErrorGetCompanyInfoState extends CompanyInformationState{
  final String error;
  const ErrorGetCompanyInfoState({required this.error});
  @override
  List<Object> get props => [error];
}



/// on accept button pressed state////////////////

class OnAcceptButtonState extends CompanyInformationState{
  final bool isPop;
  const OnAcceptButtonState({required this.isPop});
  @override
  List<Object> get props => [isPop];
}
/// here for upload image state
class LoadingUploadImageState extends CompanyInformationState{}
class LoadedUploadImageState extends CompanyInformationState{
  final String imgUrl;
  const LoadedUploadImageState({
    required this.imgUrl
});
  @override
  List<Object> get props => [imgUrl];
}
class ErrorUploadImageState extends CompanyInformationState{
  final String error;
  const ErrorUploadImageState({required this.error});
  @override
  List<Object> get props => [error];
}


///
/// here for add company
///
class LoadingAddCompanyState extends CompanyInformationState{}
class LoadedAddCompanyState extends CompanyInformationState{}
class ErrorAddCompanyState extends CompanyInformationState{
  final String error;
  const ErrorAddCompanyState({required this.error});
  @override
  List<Object> get props => [error];
}






