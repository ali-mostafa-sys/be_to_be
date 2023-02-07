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
  const ExpandedEvent({required this.index });
  @override
  List<Object> get props => [index];
}
///
/// here for get all data
///

class GetAllDataEvent extends BeToBeEvent{}

















