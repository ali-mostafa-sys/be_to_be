import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:be_to_be/features/company_information/data/models/add_company_mosel/add_company_model.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/city_entity/city_entity.dart';
import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';
import 'package:be_to_be/features/company_information/domain/usecase/add_company_usecase/add_company_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_cities_usecase/get_all_cities_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_country_usecase/get_al_country_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/uploadImage_usecase/upload_image_usecase.dart';
import 'package:geocoding/geocoding.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/company_information/domain/entity/all_company_type_entity.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_company_type_usecase/get_all_company_type_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'company_information_event.dart';

part 'company_information_state.dart';

class CompanyInformationBloc
    extends Bloc<CompanyInformationEvent, CompanyInformationState> {
  static CompanyInformationBloc get(context) => BlocProvider.of(context);

  final GetAllCompanyTypeUseCase getAllCompanyTypeUseCase;
  final GetAllCountryUseCase getAllCountryUseCase;
  final GetAllCitiesUseCase getAllCitiesUseCase;
  final UploadImageUseCase uploadImageUseCase;
  final AddCompanyUseCase addCompanyUseCase;
  final SharedPreferences sharedPreferences;
  /// here for dialog
  bool isPop=false;

/// here for fields
  TextEditingController companyName = TextEditingController();
  TextEditingController establishDate = TextEditingController();
  TextEditingController licenseNumber = TextEditingController();
  TextEditingController licenseExpireDate = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController buildingNumber = TextEditingController();
  TextEditingController moreAddressInfo = TextEditingController();
  /// here for dropDownButton choose company type
  final List<CompanyTypeEntity> companyType = [];
  String? selectedCompanyType;
  int? selectedCompanyId;
  ///here for dopDownButton Choose country
   List<CountryEntity> country = [];
  String? selectedCountry;
  int? selectedCountryId;
  ///here for dopDownButton Choose cities
  List<CityEntity> cities = [];
  List<CityEntity> citiesList = [];
  String? selectedCity;
  int? selectedCityId;
  /// here for pick license image
  File? licenseImage;
  ImagePicker pickedLicenseImage = ImagePicker();
  String? imageUrl;

  Future getLicenseImage() async {
    final imagePicked =
    await pickedLicenseImage.pickImage(source: ImageSource.gallery);
    if (imagePicked == null) return;

    if (imagePicked != null) {
      File imageTemporary = File(imagePicked.path);
      licenseImage = imageTemporary;
      emit(PickImageForLicenseState());

      print('Success');
    } else {
      print('Error');
      emit(ErrorPickImageForLicenseState());
    }
  }

  /// her current location

  Position? currentPosition;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    /// Test if location services are enabled.
    emit(LoadingGetCurrentLocationState());
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      emit(ErrorGetCurrentLocationState());
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        emit(ErrorGetCurrentLocationState());
        return Future.error('Location permissions are denied');

      }
    }

    if (permission == LocationPermission.deniedForever) {
      /// Permissions are denied forever, handle appropriately.
      emit(ErrorGetCurrentLocationState());
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');

    }

    /// When we reach here, permissions are granted and we can
    /// continue accessing the position of the device.
    print('////////////////////////////////////////////////////////////////////////');
    print(await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high));
    emit(GetCurrentLocationState());


    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation,);
  }
// here for choose location of company
/// here to send latLong location
  LatLng? markerLocation;
 double lat=0;
 double lang=0;
  Marker? myMarker;
  Position? companyPosition;
  //List<Placemark>? placemark;

  handleTap(LatLng tappedPoint) {

    markerLocation = tappedPoint;
   //companyPosition=tappedPoint;
    print (markerLocation!.latitude.toString());
    print (markerLocation!.longitude.toString());


    ///here for marker////////////////////////////////
     myMarker=Marker(
       markerId: MarkerId(tappedPoint.toString()),
       position: tappedPoint,
       icon: BitmapDescriptor.defaultMarker,
     );
     emit(ChooseLocationOfCompanyState(latLng: markerLocation!));

  }

  Future<void> GetCompanyLocationInformation (LatLng position)async{
    emit(LoadingGetCompanyInfoState());
   List<Placemark> placemark=await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place =placemark[0];
     street.text='${place.street}';
     area.text  ='${place.subAdministrativeArea}';
    emit(LoadedGetCompanyInfoState());
  }









  CompanyInformationBloc({
    required this.getAllCompanyTypeUseCase,
    required this.uploadImageUseCase,
    required this.getAllCountryUseCase,
    required this.getAllCitiesUseCase,
    required this.addCompanyUseCase,
    required this.sharedPreferences,
  }) : super(CompanyInformationInitial()) {
    on<CompanyInformationEvent>((event, emit) async {
      ///
      /// here for get all company types data /////////////////////////////////
      ///
      if (event is GetAllCompanyTypeEvent) {
        print(sharedPreferences.getString('companyInformation'));
       // final ali=sharedPreferences.getString('companyInformation');
        //print(ali!.nameEn.toString());

        String? companyInformation= sharedPreferences.getString('companyInformation');
        emit(LoadingGetCompanyTypeState());
        final failureOrGetAllCompanyType = await getAllCompanyTypeUseCase();
        failureOrGetAllCompanyType.fold((failure) async {
          emit(ErrorGetCompanyTypeState(error: _mapFailureToMessage(failure)));

        }, (allCompanyType) async {

          allCompanyType.data.map((e) {
            companyType.add(e);
          }).toList();
          if(companyInformation!=null){

            //print(companyInformation);
            selectedCountryId= sharedPreferences.getInt('countryId',);
            for(int i=0;i<country.length;i++){
              if(selectedCountryId==country[i].countryId){
                selectedCountry=country[i].nameEn;

              }
            }
            final data=jsonDecode(companyInformation!);
            print('=====================================  ');
            print(data);
            print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
            print(data['nameEn']);
            companyName.text=data['nameEn'];



             licenseNumber.text=data['licenseNumber'].toString();
             establishDate.text=data['establishAt'].toString();
             imageUrl=data['licenseImgUrl'].toString();
             area.text=data['area'].toString();
             street.text=data['street'].toString();
             buildingNumber.text=data['buildingNumber'].toString();
             markerLocation!=LatLng(double.parse(data['addressLatitude']),double.parse(data['addressLongitude']));
            moreAddressInfo.text=data['moreAddressInfo'].toString();
            licenseExpireDate.text=data['licenseExpirAt'].toString();
            selectedCityId=int.parse(data['cityId']);
            for(int i=0;i<citiesList.length;i++){
              if(selectedCityId==citiesList[i].cityId){
                selectedCity=citiesList[i].nameEn;
              }
            }
            selectedCompanyId=int.parse(data['companyTypeId']);
            for( int j=0;j<companyType.length;j++){
              if(selectedCompanyId==companyType[j].companyTypeId){
                selectedCompanyType=companyType[j].companyType;
              }
            }
               // .latitude=double.parse(companyInformation.addressLatitude);

          }


          emit(LoadedGetCompanyTypeState());
        });
      }

      ///
      /// here for get all counties
      ///
      if (event is GetAllCountriesEvent) {
        emit(LoadingGetCountiesState());
        final failureOrGetAllCountry = await getAllCountryUseCase();
        failureOrGetAllCountry.fold((failure) async {
          emit(ErrorGetCountiesState(error: _mapFailureToMessage(failure)));
          print('error');
        }, (allCountry) async {
          //country=allCountry;
          allCountry.map((e) {
            country.add(e);
          }).toList();
          emit(LoadedGetCountiesState(countryId: selectedCountryId));
        });
      }
      ///
      /// here for get all cities
      ///
      if(event is GetAllCitiesEvent){
        cities=[];
        selectedCity=null;
        emit(LoadingGetCitiesState());
        final failureOrGetAllCities = await getAllCitiesUseCase(event.countryId);
        failureOrGetAllCities.fold((failure) async {
          emit(ErrorGetCitiesState(error: _mapFailureToMessage(failure)));
          print('error');
        }, (allCities) async {
          cities=[];
          selectedCity=null;



          allCities.map((e) {
            cities.add(e);
          }).toList();
          if(selectedCityId!=null){
            for(int i=0;i<cities.length;i++){
              if(selectedCityId==cities[i].cityId){
                selectedCity=cities[i].nameEn;
              }
            }
          }

          emit(LoadedGetCitiesState(cityName: cities[1].nameEn));
        });

      }
      ///
      /// here for city dropDown button selected///////
      ///
      if(event is SelectedValueForCitiesDropDownButtonEvent){
        selectedCity=event.selectedValue;
        for (int i = 0; i < cities.length-1; i++) {
          if (selectedCity == cities[i].nameEn) {
            selectedCityId = cities[i].cityId;
            print(selectedCityId);
          }
        }
        emit(SelectedValueForCitiesDropDownButtonState(selectedValue: selectedCity!));

      }


      ///
      /// here for company drop down button selected//////////
      ///
      if (event is SelectedValueForDropDownButtonEvent) {
        selectedCompanyType = event.selectedValue;

        for (int i = 0; i < companyType.length-1; i++) {
          if (selectedCompanyType == companyType[i].companyType) {
            selectedCompanyId = companyType[i].companyTypeId;
             print(selectedCompanyId);
          }
        }

        emit(SelectedValueForDropDownButtonState(
            selectedValue: selectedCompanyType!));
      }
      ///
      /// here for drop countries down button selected//////////
      ///
      if (event is SelectedValueForCountriesDropDownButtonEvent) {
        selectedCountry = event.selectedValue;
        cities=citiesList;
        selectedCity=null;
        selectedCountryId=null;

        for (int i = 0; i < country.length-1; i++) {
          if (selectedCountry == country[i].nameEn) {
            selectedCountryId = country[i].countryId;
            await sharedPreferences.setInt('countryId', selectedCountryId!);
            // print(selectedCompanyId);
          }
        }
        print(selectedCountryId);
        emit(SelectedValueForDropDownButtonState(
            selectedValue: selectedCountry!));
      }
      ///
      /// here for pick license image ////////////////////////
      ///
      if(event is PickImageLicenseEvent){
       await getLicenseImage();
      }
      if(event is DeleteLicenseImageEvent ){
        licenseImage=null;
        imageUrl=null;
        emit(DeleteLicenseImageState());

      }
      ///
      ///  her for get current location for user////////////////////////
      ///
      if(event is GetCurrentLocationEvent){
        // getLocation();
        // _determinePosition();
        currentPosition=await _determinePosition();
        myMarker=Marker(

            markerId: MarkerId('myMarker'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen,),



            position: LatLng(currentPosition!.latitude ,currentPosition!.longitude)

        );
        print('///////////////////////////////////////////');
        print(currentPosition!.latitude.toString());
        print(currentPosition!.longitude.toString());
        print('///////////////////////////////////////////');
      }
      ///
      ///  her for choose company location////////////////////////
      ///
      if(event is ChooseLocationOfCompanyEvent){
        handleTap;
      }
      ///
      /// here for get company location information
      ///
      if(event is GetCompanyLocationInfoEvent){
        GetCompanyLocationInformation(event.position);
      }

      ///
      /// here for dialog widget ///////////////
      ///
      if(event is OnAcceptButtonEvent){
        isPop=!isPop;
        emit(OnAcceptButtonState(isPop: isPop));
      }
///
      /// here for upload image
      ///
    if(event is UploadImageEvent){
      emit(LoadingUploadImageState());
      final failureOrUploaded=await uploadImageUseCase(event.imageFile);
      failureOrUploaded.fold(
              (failure) {
                emit(ErrorUploadImageState(error: _mapFailureToMessage(failure)));
              },
              (uploaded) {
                imageUrl=uploaded.imageUrl;
                print(uploaded.imageUrl);

                emit(LoadedUploadImageState(imgUrl:imageUrl! ));

              });
    }
    ///
      /// here for add company
      ///

      if(event is AddCompanyEvent){
        emit(LoadingAddCompanyState());

        final failureOrAddedCompany=await addCompanyUseCase(event.addCompanyEntity);
        failureOrAddedCompany.fold(
                (failure) {
                  emit(ErrorAddCompanyState(error: _mapFailureToMessage(failure)));
                },
                (addedCompany) {
                  emit(LoadedAddCompanyState());
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
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}


