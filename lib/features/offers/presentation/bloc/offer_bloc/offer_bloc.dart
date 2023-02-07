import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/offers/domain/entity/cities_entity/cities_offer_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/usecase/delete_offer_usecase/delete_offer_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_all_offers_usecase/get_all_offers_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_all_tender_usecase/get_all_tender_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_cities_offer_usecase/get_cities_offer_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/post_accept_offer_usecase/post_accept_offer_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'offer_event.dart';

part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  static OfferBloc get(context) => BlocProvider.of(context);
  final GetAllTenderUseCase allTenderUseCase;
  final GetAllOffersUseCase getAllOffersUseCase;
  final DeleteOfferUseCase deleteOfferUseCase;
  final GetCitiesOfferUseCase getCitiesOfferUseCase;
  final PostAcceptOfferUseCase acceptOfferUseCase;

  // bool isExpanded=true;
  List<bool> isExpandedList = [];
  List<bool> loadingWidget = [];
  List<GetAllTenderEntity> allTenderGet = [];
  List<GetAllOfferOnTenderEntity> offers = [];

  /// here for time
  List<String> deliveryTimePeriod = [];
  List<String> maxTenderPeriod = [];
  List<int> totalPrices = [];

  /// here for cities
  List<CitiesOfferEntity> citiesList = [];

  List<String?> location = [];

  OfferBloc({
    required this.allTenderUseCase,
    required this.getAllOffersUseCase,
    required this.deleteOfferUseCase,
    required this.getCitiesOfferUseCase,
    required this.acceptOfferUseCase,
  }) : super(OfferInitial()) {
    on<OfferEvent>((event, emit) async {
      ///
      /// here for get cities
      ///
      if (event is GetAllCitiesOfferEvent) {
        emit(LoadingGetCitiesOfferState());
        final failureOrGetCities = await getCitiesOfferUseCase();
        failureOrGetCities.fold((failure) {
          emit(ErrorGetCitiesOfferState(error: _mapFailureToMessage(failure)));
        }, (cities) {
          citiesList = cities;
          emit(LoadedGetCitiesOfferState());
        });
      }

      ///
      ///here for expanded event and get all offers on tender
      ///
      if (event is ExpandedAndGetOffersOnTenderEvent) {
        loadingWidget[event.index] = false;

        emit(LoadingGetOffersAndExpandedState());
        print(event.tenderId);

        final failureOrGetOffersOnTender =
            await getAllOffersUseCase(event.tenderId);

        failureOrGetOffersOnTender.fold((failure) {
          loadingWidget[event.index] = true;
          emit(ErrorGetOffersAndExpandedState(
              error: _mapFailureToMessage(failure)));
        }, (allOffer) {
          for (int i = 0; i < allOffer.length; i++) {
            if (allOffer[i].offerCityId != null) {
              citiesList.map((e) {
                if (e.idCity == allOffer[i].offerCityId) {
                  location.add(e.nameEn);
                }
              }).toList();
            } else {
              location.add('aliMo');
            }
          }

          ///asdadada///////////////////////////////////////
          loadingWidget[event.index] = true;
          offers = allOffer;
          totalPrices = [];
          for (int i = 0; i < allOffer.length; i++) {
            if (allOffer[i].tax != null) {
              final itemsPrice = allOffer[i].quantity * allOffer[i].priceUSD;
              final price = itemsPrice * allOffer[i].tax!;
              final percent = price / 100;

              final totalPrice = itemsPrice + percent;
              totalPrices.add(totalPrice.toInt());
            }
            final allPrice = allOffer[i].quantity * allOffer[i].priceUSD;
            totalPrices.add(allPrice.toInt());
          }

          for (int i = 0; i < isExpandedList.length; i++) {
            if (i == event.index) {
              isExpandedList[i] = !isExpandedList[i];
            } else {
              isExpandedList[i] = false;
            }
          }
          print('==============================================');
          print(location);
          print('==============================================');
          //isExpandedList[event.index]=!isExpandedList[event.index];
          emit(LoadedGetOfferAndExpandedState(
              isExpanded: isExpandedList[event.index]));
        });

        // isExpandedList[event.index]=!isExpandedList[event.index];
        // emit(LoadedGetOffersAndExpandedState(isExpanded: isExpandedList[event.index]));
      }

      ///
      /// here for get all tender event
      ///
      if (event is GetAllTenderEvent) {
        emit(LoadingGetAllTenderState());
        final failureOrGetAllTender = await allTenderUseCase();

        failureOrGetAllTender.fold((failure) {
          emit(ErrorGetAllTenderState(error: _mapFailureToMessage(failure)));
        }, (allTender) {
          maxTenderPeriod = [];
          allTenderGet = [];
          isExpandedList = [];
          loadingWidget = [];

          if (event.sortValue != 'aliMo') {
            allTender = _sortButton(event.sortValue, allTender);
          } else {
            allTender = allTender;
          }

          allTender.map((e) {
            if (e.status == 'OPENED') {
              final deliveryBefore = DateTime.parse(e.deliverBefore)
                  .difference(DateTime.now())
                  .inDays
                  .toString();
              deliveryTimePeriod.add(deliveryBefore!);

              final from = DateTime.parse(e.from);
              final to = DateTime.parse(e.to);
              final maxTenderPeriodItem =
                  to!.difference(from!).inDays.toString();
              maxTenderPeriod.add(maxTenderPeriodItem!);
              allTenderGet.add(e);
              isExpandedList.add(false);
              loadingWidget.add(true);
            }
          }).toList();

          emit(LoadedGetAllTenderState());
        });
      }

      ///
      /// here for delete offer
      ///

      if (event is DeleteOfferEvent) {
        emit(LoadingDeleteOfferState());
        final failureOrDeleteOffer = await deleteOfferUseCase(event.offerId);
        failureOrDeleteOffer.fold((failure) {
          emit(ErrorDeleteOfferState(error: _mapFailureToMessage(failure)));
        }, (deleteOffer) {
          for (int i = 0; i < isExpandedList.length; i++) {
            isExpandedList[i] = false;
          }
          emit(LoadedDeleteOfferState());
        });
      }
      ///
      /// here for accepted offer event
      ///
   if(event is AcceptedOfferEvent){
     emit(LoadingAcceptedOfferState());
     print(event.offerId);

     final failureOrAccepted=await acceptOfferUseCase(event.offerId);
     failureOrAccepted.fold(
             (failure) {
               emit(ErrorAcceptedOfferState(error: _mapFailureToMessage(failure)));
             },
             (accepted) {
               emit(LoadedAcceptedOfferState(offerId: event.offerId));
             });

   }


    });
  }

  List<GetAllTenderEntity> _sortButton(
      String sortValue, List<GetAllTenderEntity> list) {
    switch (sortValue) {

      /// here i dont have rate
      case "Rate":
        return list..sort((a, b) => a.creatorScore.compareTo(b.creatorScore));

      case "Quantity":
        return list..sort((a, b) => a.brandName.compareTo(b.brandName));
      case "Latest Time":
        return list..sort((a, b) => a.deliverBefore.compareTo(b.deliverBefore));

      /// here i do no have price
      case "Price":
        return list..sort((a, b) => a.categoryName.compareTo(b.categoryName));
      case "Include Delivery":
        return list..sort((a, b) => a.to.compareTo(b.to));
      default:
        return list..sort((a, b) => a.to.compareTo(b.to));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      case TenderIsEmptyFailure:
        return tenderIsEmptyMessage;
      case OffersIsEmptyFailure:
        return offersIsEmptyMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
