part of 'offer_bloc.dart';

abstract class OfferEvent extends Equatable {
  const OfferEvent();
  @override
  List<Object> get props => [];
}

/// here for expanded event and get offers on tender event
class ExpandedAndGetOffersOnTenderEvent extends OfferEvent{
final int  index;
final int  tenderId;
const ExpandedAndGetOffersOnTenderEvent({
  required this.index,
  required this.tenderId,
});
@override
List<Object> get props => [index,tenderId];

}
///
/// get all tender event
///
class GetAllTenderEvent  extends OfferEvent{
  final String sortValue;
  const GetAllTenderEvent({
    required this.sortValue
});
  @override
  List<Object> get props => [sortValue];
}
///
/// here for delete offer
///
class DeleteOfferEvent extends OfferEvent{
  final int offerId;
  const DeleteOfferEvent({required this.offerId});
  @override
  List<Object> get props => [offerId];
}

///
/// here for get all cities
///
class GetAllCitiesOfferEvent extends OfferEvent{}


///
/// here for accepted offer event
///
class AcceptedOfferEvent extends OfferEvent{
  final int offerId;
  const AcceptedOfferEvent({
    required this.offerId
});
  @override
  List<Object> get props => [offerId];
}











