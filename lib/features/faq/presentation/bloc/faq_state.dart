part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  const FaqState();
  @override
  List<Object> get props => [];
}

class FaqInitial extends FaqState {
  @override
  List<Object> get props => [];
}


class LoadingFQAState extends FaqState{}
class LoadedFQAState extends FaqState{}
class ErrorFQAState extends FaqState{
  final String error;
 const  ErrorFQAState({
    required this.error,
});
  @override
  List<Object> get props => [error];
}
