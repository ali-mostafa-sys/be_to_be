part of 'company_information_bloc.dart';

abstract class CompanyInformationEvent extends Equatable {
  const CompanyInformationEvent();
  @override
  List<Object> get props => [];
}

/// here for get all company types data /////////////////////////////////
class GetAllCompanyTypeEvent extends CompanyInformationEvent{
  @override
  List<Object> get props => [];
}
/// here for get all countries
class GetAllCountriesEvent extends CompanyInformationEvent{
  @override
  List<Object> get props => [];
}
/// here for get all cities
class GetAllCitiesEvent extends CompanyInformationEvent{
  final int countryId;
  const GetAllCitiesEvent({required this.countryId});
  @override
  List<Object> get props => [countryId];
}

/// here for company drop down button selected//////////

class SelectedValueForDropDownButtonEvent extends CompanyInformationEvent{
  final String selectedValue;
  const SelectedValueForDropDownButtonEvent({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];
}

/// here for countries drop down button selected//////////

class SelectedValueForCountriesDropDownButtonEvent extends CompanyInformationEvent{
  final String selectedValue;
  const SelectedValueForCountriesDropDownButtonEvent({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];
}
/// here for cities drop down button selected//////////

class SelectedValueForCitiesDropDownButtonEvent extends CompanyInformationEvent{
  final String selectedValue;
  const SelectedValueForCitiesDropDownButtonEvent({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];
}
/// here for pick license image ///////////////////////////

class PickImageLicenseEvent extends CompanyInformationEvent{}
class DeleteLicenseImageEvent extends CompanyInformationEvent{}
/// her for get current location for user /////////////////

class GetCurrentLocationEvent extends CompanyInformationEvent{}

class ChooseLocationOfCompanyEvent extends CompanyInformationEvent{}
class GetCompanyLocationInfoEvent extends CompanyInformationEvent{
  final LatLng position;
  const GetCompanyLocationInfoEvent({required this.position});
  @override
  List<Object> get props => [position];

}

/// on accept button pressed event///////////

class OnAcceptButtonEvent extends CompanyInformationEvent{}

/// upload image
class UploadImageEvent extends CompanyInformationEvent{
  final File imageFile;
  const UploadImageEvent({
    required this.imageFile
});
  @override
  List<Object> get props => [imageFile];
}

///
/// here for add company
///
class AddCompanyEvent extends CompanyInformationEvent{
  final AddCompanyEntity addCompanyEntity ;
  const AddCompanyEvent({required this.addCompanyEntity});
  @override
  List<Object> get props => [addCompanyEntity];
}





