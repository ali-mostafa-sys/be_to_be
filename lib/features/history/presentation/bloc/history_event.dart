part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
  @override
  List<Object> get props => [];
}

///
/// order or tender event
///
class TenderOrOrderEvent extends HistoryEvent{
  final String isOrder;
  const TenderOrOrderEvent({
    required this.isOrder
});
  @override
  List<Object> get props => [isOrder];
}
///
/// here for get tender event
///
class GetTenderHEvent extends  HistoryEvent{}

///
/// here for get order
///
class GetOrdersHEvent extends  HistoryEvent{}







