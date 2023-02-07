part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}
///
///here for login event
///
class LoginButtonEvent extends LoginEvent{
final LoginEntity loginEntity;
const LoginButtonEvent({required this.loginEntity});

  @override
  List<Object> get props => [loginEntity];
}


///
/// change obSecure of password
///

class ChangeObSecurePasswordEvent extends LoginEvent{}
///
/// here for get token
///
class GetTokenEvent extends LoginEvent{}









