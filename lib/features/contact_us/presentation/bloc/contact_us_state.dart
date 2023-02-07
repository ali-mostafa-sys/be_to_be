part of 'contact_us_bloc.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();
  @override
  List<Object> get props => [];
}

class ContactUsInitial extends ContactUsState {
  @override
  List<Object> get props => [];
}

class LoadingGetContactUsState extends ContactUsState{}
class LoadedGetContactUsState extends ContactUsState{}
class ErrorGetContactUsState extends ContactUsState{
  final String error;
  const ErrorGetContactUsState({
    required this.error,
});
  @override
  List<Object> get props => [error];
}

