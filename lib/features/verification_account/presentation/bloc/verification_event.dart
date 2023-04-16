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
class GetOTPCodeEvent extends VerificationEvent{
  final bool byEmail;
  const GetOTPCodeEvent({required this.byEmail});
  @override
  List<Object> get props => [byEmail];

}
///
/// here for send OTP message
///

class SendOTPMessageEvent extends VerificationEvent{
  final String loginName;
  final String code;
  final RegisterEntity registerEntity;
  const SendOTPMessageEvent({
    required this.loginName,
    required this.code,
    required this.registerEntity,
});
  @override
  List<Object> get props => [loginName,code,registerEntity];
}