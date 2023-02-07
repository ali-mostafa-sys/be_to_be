part of 'offer_bloc.dart';

abstract class OfferState extends Equatable {
  const OfferState();
  @override
  List<Object> get props => [];
}

class OfferInitial extends OfferState {
  @override
  List<Object> get props => [];
}

///
/// here for expanded and get tender offers state
///
class LoadingGetOffersAndExpandedState extends OfferState{}
class LoadedGetOfferAndExpandedState extends OfferState{
  final bool isExpanded;
  const LoadedGetOfferAndExpandedState({
    required this.isExpanded,
});
  @override
  List<Object> get props => [isExpanded];
}
class ErrorGetOffersAndExpandedState extends OfferState{
  final String error;
  const ErrorGetOffersAndExpandedState({
    required this.error
});
  @override
  List<Object> get props => [error];
}
///
/// here for get all tender state
///
class LoadingGetAllTenderState extends OfferState{}
class LoadedGetAllTenderState extends OfferState{}
class ErrorGetAllTenderState extends OfferState{
  final String error;
  const ErrorGetAllTenderState({
    required this.error
});
  @override
  List<Object> get props => [error];
}
///
/// here for delete offer state
///
class LoadingDeleteOfferState extends OfferState{}
class LoadedDeleteOfferState extends OfferState{}
class ErrorDeleteOfferState extends OfferState{
  final String error;
  const ErrorDeleteOfferState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}

///
/// here for get all cities state
///
class LoadingGetCitiesOfferState extends OfferState{}
class LoadedGetCitiesOfferState extends OfferState{}
class ErrorGetCitiesOfferState extends OfferState{
  final String error;
  const ErrorGetCitiesOfferState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

///
/// here for accepted offer state
///
class LoadingAcceptedOfferState extends OfferState{}
class LoadedAcceptedOfferState extends OfferState{
  final int offerId;
  const LoadedAcceptedOfferState({
    required this.offerId
  });
  @override
  List<Object> get props => [offerId];
}
class ErrorAcceptedOfferState extends OfferState{
  final String error;
  const ErrorAcceptedOfferState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}














