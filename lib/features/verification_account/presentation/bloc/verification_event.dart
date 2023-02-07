part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();
  @override
  List<Object> get props => [];
}


class OnOpenVerificationPageEvent extends VerificationEvent{}

///
/// here for receive OTP code
///
class GetOTPCodeEvent extends VerificationEvent{}
///
/// here for send OTP message
///

class SendOTPMessageEvent extends VerificationEvent{
  final String loginName;
  final String code;
  const SendOTPMessageEvent({
    required this.loginName,
    required this.code,
});
  @override
  List<Object> get props => [loginName,code];
}