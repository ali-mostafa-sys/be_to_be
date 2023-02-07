part of 'terms_bloc.dart';

abstract class TermsState extends Equatable {
  const TermsState();
  @override
  List<Object> get props => [];
}

class TermsInitial extends TermsState {
  @override
  List<Object> get props => [];
}

class LoadingTermsState extends TermsState{}
class LoadedTermsState extends TermsState{}
class ErrorTermsState extends TermsState{
  final String error;
  const ErrorTermsState({
    required this.error
});
  @override
  List<Object> get props => [error];
}

