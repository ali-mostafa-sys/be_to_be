part of 'privacy_bloc.dart';

abstract class PrivacyState extends Equatable {
  const PrivacyState();
  @override
  List<Object> get props => [];
}

class PrivacyInitial extends PrivacyState {
  @override
  List<Object> get props => [];
}

class LoadingPrivacyState extends PrivacyState{}
class LoadedPrivacyState extends PrivacyState{}
class ErrorPrivacyState extends PrivacyState{
  final String error;
  ErrorPrivacyState({
    required this.error,
});
  @override
  List<Object> get props => [error];
}


