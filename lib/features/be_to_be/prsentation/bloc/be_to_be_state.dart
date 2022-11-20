part of 'be_to_be_bloc.dart';

abstract class BeToBeState extends Equatable {
  const BeToBeState();
  @override
  List<Object> get props => [];
}

class BeToBeInitial extends BeToBeState {
  @override
  List<Object> get props => [];
}

///
/// here for expanded state
///
class ExpandedState extends BeToBeState{
  final bool isExpanded;
  const ExpandedState({required this.isExpanded});
  @override
  List<Object> get props => [isExpanded];
}
///
/// here for get all data state
///
class LoadingGetALLdDataState extends BeToBeState{}
class LoadedGetALLdDataState extends BeToBeState{}
class ErrorGetALLdDataState extends BeToBeState{
  final String error;
  const ErrorGetALLdDataState({required this.error});
  @override
  List<Object> get props => [error];
}

















