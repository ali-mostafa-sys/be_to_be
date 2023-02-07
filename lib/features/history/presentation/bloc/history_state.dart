part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}
///
/// here for order or tender
///

class TenderOrOrderState extends HistoryState{
  final String isOrder;

const  TenderOrOrderState({
    required this.isOrder
});
  @override
  List<Object> get props => [isOrder];
}

///
/// here for get tender state
///

class LoadingGetTenderHState extends HistoryState{}
class LoadedGetTenderHState extends HistoryState{
  final List<TenderHEntity> tenderList;
  const LoadedGetTenderHState({
    required this.tenderList
});
  @override
  List<Object> get props => [tenderList];
}
class ErrorGetTenderHState extends HistoryState{
  final String error;
  const ErrorGetTenderHState({
    required this.error
});
  @override
  List<Object> get props => [error];

}

///
/// here for get tender state
///

class LoadingGetOrdersHState extends HistoryState{}
class LoadedGetOrdersHState extends HistoryState{
  final List<OrderHEntity> orderList;
  const LoadedGetOrdersHState({
    required this.orderList
  });
  @override
  List<Object> get props => [orderList];
}
class ErrorGetOrdersHState extends HistoryState{
  final String error;
  const ErrorGetOrdersHState({
    required this.error
  });
  @override
  List<Object> get props => [error];

}





