part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();
  @override
  List<Object> get props => [];
}

///
/// here for get code event
///
class GetCodeEvent extends ForgetPasswordEvent{
  final String email;

  const GetCodeEvent({
    required this.email
});
  @override
  List<Object> get props => [email];
}
///
/// here for post new password
///

class PostNewPasswordEvent extends ForgetPasswordEvent{
  final String email;
  final String password;
  final String code;

  const PostNewPasswordEvent({
    required this.email,
    required this.code,
    required this.password,
  });
  @override
  List<Object> get props => [email,password,code];
}




