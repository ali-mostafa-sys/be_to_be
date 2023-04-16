part of 'more_info_b2b_bloc.dart';

abstract class MoreInfoB2bState extends Equatable {
  const MoreInfoB2bState();
  @override
  List<Object> get props => [];
}

class MoreInfoB2bInitial extends MoreInfoB2bState {
  @override
  List<Object> get props => [];
}
///
/// here for get tender owner info state
///
class LoadingGetTenderOwnerInfoState extends MoreInfoB2bState{}
class LoadedGetTenderOwnerInfoState extends MoreInfoB2bState{}
class ErrorGetTenderOwnerInfoState extends MoreInfoB2bState{
  final String error;
  const ErrorGetTenderOwnerInfoState({
    required this.error
});
  @override
  List<Object> get props => [error];
}
///
/// here for get offer owner info state
///
class LoadingGetOfferOwnerInfoState extends MoreInfoB2bState{}
class LoadedGetOfferOwnerInfoState extends MoreInfoB2bState{}
class ErrorGetOfferOwnerInfoState extends MoreInfoB2bState{
  final String error;
  const ErrorGetOfferOwnerInfoState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}
///
/// here for post offer executed state
///
class LoadingPostOfferExecutedState extends MoreInfoB2bState{}
class LoadedPostOfferExecutedState extends MoreInfoB2bState{}
class ErrorPostOfferExecutedState extends MoreInfoB2bState{
  final String error;
  const ErrorPostOfferExecutedState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}

///
/// here for show info
///

class ShowInfoState extends  MoreInfoB2bState{
  final  bool tenderOwner;
  final bool offerOwner;
  const ShowInfoState({required this.offerOwner,required this.tenderOwner});
  @override
  List<Object> get props => [offerOwner,tenderOwner];
}








