part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}
///
/// here for get code state
///
class LoadingGetCodeState extends ForgetPasswordState{}
class LoadedGetCodeState extends ForgetPasswordState{}
class ErrorGetCodeState extends ForgetPasswordState{
  final String error;
  const ErrorGetCodeState({
    required this.error
});
  @override
  List<Object> get props => [error];
}
///
///here for post new password
///

class LoadingPostNewPasswordState extends  ForgetPasswordState{}
class LoadedPostNewPasswordState extends  ForgetPasswordState{}
class ErrorPostNewPasswordState extends  ForgetPasswordState{
  final String error;
  const ErrorPostNewPasswordState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}






