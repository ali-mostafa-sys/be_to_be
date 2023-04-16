part of 'be_to_be_bloc.dart';

abstract class BeToBeEvent extends Equatable {
  const BeToBeEvent();
  @override
  List<Object> get props => [];
}
///
/// here for expanded event
///
class ExpandedEvent extends BeToBeEvent{

  final int index;
  final int tenderId;
  final int isExecuted;
  const ExpandedEvent({
    required this.index,
    required this.tenderId,
    required this.isExecuted,
  });
  @override
  List<Object> get props => [index,tenderId,isExecuted];
}
///
/// here for get all data
///

class GetAllDataEvent extends BeToBeEvent{
  final bool isPending;
  const GetAllDataEvent({
    required this.isPending
});
  @override
  List<Object> get props => [isPending];

}

///
/// here for delivered event
///

class IsDeliveredEvent extends BeToBeEvent{
  final bool isDelivered;
  final bool isPending;
 const IsDeliveredEvent({
    required this.isDelivered,
    required this.isPending,
});
  @override
  List<Object> get props => [isDelivered,isPending];
}













