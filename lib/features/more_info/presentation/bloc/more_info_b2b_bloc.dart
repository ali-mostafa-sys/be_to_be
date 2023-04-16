import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/more_info/domain/entity/offer_owner_info_entity/offer_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/entity/tender_owner_info_entity/tender_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/usecase/get_offer_owner_info_usecase/get_offer_owner_info_usecase.dart';
import 'package:be_to_be/features/more_info/domain/usecase/get_tender_owner_info_usecase/get_tender_owner_info_usecase.dart';
import 'package:be_to_be/features/more_info/domain/usecase/post_offer_executed_usecase/post_offer_executed_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_info_b2b_event.dart';
part 'more_info_b2b_state.dart';

class MoreInfoB2bBloc extends Bloc<MoreInfoB2bEvent, MoreInfoB2bState> {

  static MoreInfoB2bBloc get(context)=>BlocProvider.of(context);

  final GetTenderOwnerInfoUseCase getTenderOwnerInfoUseCase;
  final GetOfferOwnerInfoUseCase getOfferOwnerInfoUseCase;
  final PostOfferExecutedUseCase offerExecutedUseCase;

 TenderOwnerInfoEntity? tenderOwnerInfoEntity;
 OfferOwnerInfoEntity? offerOwnerInfoEntity;

 bool tenderOwner=false;
 bool offerOwner=false;

  MoreInfoB2bBloc({
    required this.getTenderOwnerInfoUseCase,
    required this.getOfferOwnerInfoUseCase,
    required this.offerExecutedUseCase,
}) : super(MoreInfoB2bInitial()) {
    on<MoreInfoB2bEvent>((event, emit) async{

      ///
      /// here for get tender owner info event
      ///
      if(event is GetTenderOwnerInfoEvent){
        emit(LoadingGetTenderOwnerInfoState());

        final failureOrTenderOwnerInfo=await getTenderOwnerInfoUseCase(event.tenderId);
        failureOrTenderOwnerInfo.fold(
                (failure) {
                  emit(ErrorGetTenderOwnerInfoState(error: _mapFailureToMessage(failure)));
                },
                (tenderInfo) {
                  tenderOwnerInfoEntity=tenderInfo;
                  emit(LoadedGetTenderOwnerInfoState());
                });

      }
      ///
      /// here for get offer owner info event
      ///
if(event is GetOfferOwnerInfoEvent){
  emit(LoadingGetOfferOwnerInfoState());
  final failureOrOfferOwnerInfo=await getOfferOwnerInfoUseCase(event.offerId);
  failureOrOfferOwnerInfo.fold(
          (failure) {
            emit(ErrorGetOfferOwnerInfoState(error: _mapFailureToMessage(failure)));

          },
          (offerOwnerInfo) {
            offerOwnerInfoEntity=offerOwnerInfo;
            emit(LoadedGetOfferOwnerInfoState());

          });
}
///
      /// here for offer executed event
      ///
if(event is PostOfferExecutedEvent) {
  emit(LoadingPostOfferExecutedState());

  final failureOrExecuted=await offerExecutedUseCase(event.offerId);
  failureOrExecuted.fold(
          (failure) {
            emit(ErrorPostOfferExecutedState(error: _mapFailureToMessage(failure)));

          },
          (executed) {
            emit(LoadedPostOfferExecutedState());
          });
}
///
      /// here for show info event
      ///
if(event is ShowInfoEvent){

   tenderOwner=event.tenderOwner;
   offerOwner=event.offerOwner;
   emit(ShowInfoState(offerOwner: offerOwner, tenderOwner: tenderOwner));



}







    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      case TenderIsEmptyFailure:
        return b2bHistoryIsEmptyMessage;
      case OffersOnTenderB2BIsEmptyFailure:
        return 'There is no Offers';

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
