import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/city_add_tender_entity/city_add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/get_country_entity/get_country_entity.dart';
import 'package:be_to_be/features/add_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/add_tender_usecase/add_tender_usecse.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_all_cities_add_tender_usecase/get_all_cities_add_tender_usecase.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_all_product_usecase/get_all_product_usecase.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_countries_usecase/get_countries_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_tender_event.dart';
part 'add_tender_state.dart';

class AddTenderBloc extends Bloc<AddTenderEvent, AddTenderState> {
  static AddTenderBloc get(context)=> BlocProvider.of(context);

  final GetAllProductUseCase getAllProductUseCase;
  final GetCountriesAddTenderUseCase getCountriesUseCase;
  final GetAllCitiesAddTenderUseCase getAllCitiesAddTenderUseCase;
  final AddTenderUseCase addTenderUseCase;
  /// here for field /////////////////////////////////////////////////

  final TextEditingController itemName=TextEditingController();
  final TextEditingController quantity=TextEditingController();
  final TextEditingController maxTenderPeriod=TextEditingController();
  final TextEditingController deliveryTimePeriod=TextEditingController();
  final TextEditingController area=TextEditingController();
  final TextEditingController street=TextEditingController();
  final TextEditingController buildingNumber=TextEditingController();
  final TextEditingController moreAddressInfo=TextEditingController();
  final TextEditingController toDateText=TextEditingController();


///a////////////////////////////////////////////////////////////////////////
  String marketAddress ='UAE';
  String paymentType ='CASH';
  int quantityInt=0;
  String from ='';
  String to ='';
  String deliverBefore ='';
  /// here for get all Product
  String? selectedProduct;
  int? selectedProductId;
  List<ProductEntity>allProduct=[];
  /// here for countries
  String? selectedCountry;
  int? selectedCountryId;
  List<CountriesEntity>allCountry=[];
  /// here for cities
  String? selectedCity;
  int? selectedCityId;
  List<CityAddTenderEntity>allCities=[];



  AddTenderBloc({
    required this.getAllProductUseCase,
    required this.getCountriesUseCase,
    required this.getAllCitiesAddTenderUseCase,
    required this.addTenderUseCase,
}) : super(AddTenderInitial()) {
    on<AddTenderEvent>((event, emit) async{

      ///
      /// here for get product list event
      ///
      if(event is GetProductListEvent){
        emit(LoadingGetProductListState());

        final failureOrGetProductList=await getAllProductUseCase();
        failureOrGetProductList.fold(
                (failure) {
                  emit(ErrorGetProductListState(error: _mapFailureToMessage(failure)));
                },
                (productList) {
                  allProduct=productList;
                  print(allProduct);

                  emit(LoadedGetProductListState());
                });
      }
      ///
      /// here for selected product
      ///

      if(event is SelectedProductEvent){


        allProduct.map((e) {
          if(event.product==e.nameEn){
            selectedProduct=event.product;
            selectedProductId=e.idProduct;
          }
        }).toList();
        emit(SelectedProductState(product: selectedProduct!));



      }
      ///
      /// here for get countries event
      ///
      if(event is GetAllCountriesAddTenderEvent){
        emit(LoadingGetAllCountriesState());
        final failureOrGetAllCountries=await getCountriesUseCase();

        failureOrGetAllCountries.fold(
                (failure) {
                  emit(ErrorGetAllCountriesState(error: _mapFailureToMessage(failure)));
                },
                (countries) {
                  allCountry=countries;
                  emit(LoadedGetAllCountriesState());
                });
      }
      ///
      /// here for selected country event
      ///
      if(event is SelectedCountryAddTenderEvent){
        selectedCountry=event.country;
        allCountry.map((e) {
          if(event.country==e.nameEn){
            selectedCountryId=e.idCountry;
          }
        }).toList();
        emit(SelectedCountryAddTenderState(country: selectedCountry!));
      }

      ///
      /// here for get all cities
      ///
      if(event is GetAllCitiesAddTenderEvent){
        emit(LoadingGetAllCitiesAddTenderState());
        final failureOrGetAllCities=await getAllCitiesAddTenderUseCase(selectedCountryId!);
        failureOrGetAllCities.fold(
                (failure) {
                  emit(ErrorGetAllCitiesAddTenderState(error: _mapFailureToMessage(failure)));
                },
                (cities) {
                  allCities=cities;
                  emit(LoadedGetAllCitiesAddTenderState());

                });


      }
      ///
      /// here for selected city
      ///
      if(event is SelectedCityAddTenderEvent){
        selectedCity=event.city;
        allCities.map((e) {
          if(event.city==e.nameEn){
            selectedCityId=e.idCity;
          }
        }).toList();
        emit(SelectedCityAddTenderState(city: selectedCity!));
      }










      ///
      /// here for choose marker address event
      ///
      if(event is ChooseMarkerAddressEvent){
        marketAddress=event.markerAddress;
        print(marketAddress);
        emit(ChooseMarkerAddressState(markerAddress: event.markerAddress));
      }
      ///
      /// here for choose PaymentType event
      ///
      if(event is ChoosePaymentTypeEvent){
        paymentType=event.paymentType;
        print(paymentType);
        emit(ChoosePaymentTypeState(paymentType: event.paymentType));
      }

      ///
      /// here for add tender event
      ///
      if(event is PostAddTenderEvent){
        emit(LoadingAddTenderState());
        final failureOrAddTender=await addTenderUseCase(event.addTenderEntity);
        failureOrAddTender.fold(
                (failure) {
                  emit(ErrorAddTenderState(error: _mapFailureToMessage(failure)));
                },
                (addedTender) {
                  emit(LoadedAddTenderState());

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
      case AddTenderDailyFailure:
        return addTenderDailyMessage;
      case AddTenderMonthlyFailure:
        return addTenderMonthlyMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
