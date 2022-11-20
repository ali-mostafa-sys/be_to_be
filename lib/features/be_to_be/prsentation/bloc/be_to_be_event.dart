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
  final bool isExpanded;
  const ExpandedEvent({required this.isExpanded});
  @override
  List<Object> get props => [isExpanded];
}
///
/// here for get all data
///

class GetAllDataEvent extends BeToBeEvent{}

















