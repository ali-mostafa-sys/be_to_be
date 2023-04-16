part of 'more_info_b2b_bloc.dart';

abstract class MoreInfoB2bEvent extends Equatable {
  const MoreInfoB2bEvent();
  @override
  List<Object> get props => [];
}
///
/// here for get tender owner event
///

class GetTenderOwnerInfoEvent extends MoreInfoB2bEvent{
  final int  tenderId;
 const  GetTenderOwnerInfoEvent({
    required this.tenderId
});
  @override
  List<Object> get props => [tenderId];
}
///
/// here for get offer owner info event
///
class GetOfferOwnerInfoEvent extends MoreInfoB2bEvent{
  final int  offerId;
  const  GetOfferOwnerInfoEvent({
    required this.offerId
  });
  @override
  List<Object> get props => [offerId];

}

///
/// here for post offer executed event
///


class PostOfferExecutedEvent extends MoreInfoB2bEvent{
  final int  offerId;
  const  PostOfferExecutedEvent({
    required this.offerId
  });
  @override
  List<Object> get props => [offerId];

}
///
/// here for show info
///
class ShowInfoEvent extends MoreInfoB2bEvent{
  final  bool tenderOwner;
 final bool offerOwner;
 const ShowInfoEvent({required this.offerOwner,required this.tenderOwner});
  @override
  List<Object> get props => [offerOwner,tenderOwner];
}



