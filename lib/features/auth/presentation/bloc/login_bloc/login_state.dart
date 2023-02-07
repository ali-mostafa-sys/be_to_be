part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
///
/// change obSecure of password
///
class ChangeObSecurePasswordState extends LoginState{
  final bool obSecure;
  const ChangeObSecurePasswordState({required this.obSecure});
  @override
  List<Object> get props => [obSecure];
}


///
/// here for login state
///

class LoadingLoginState extends LoginState{}
class LoadedLoginState extends LoginState{}
class ErrorLoginState extends LoginState{
  final String error;
  const ErrorLoginState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// here for get token
///
class GetTokenState extends LoginState{}








