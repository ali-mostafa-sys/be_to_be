part of 'about_us_bloc.dart';

abstract class AboutUsState extends Equatable {
  const AboutUsState();
  @override
  List<Object> get props => [];
}

class AboutUsInitial extends AboutUsState {
  @override
  List<Object> get props => [];
}
///
/// here for get about us state
///

class LoadingGetAboutUsState extends AboutUsState{}
class LoadedGetAboutUsState extends AboutUsState{}
class ErrorGetAboutUsState extends AboutUsState{
  final String error;
  const ErrorGetAboutUsState({
    required this.error
});
  @override
  List<Object> get props => [error];
}




