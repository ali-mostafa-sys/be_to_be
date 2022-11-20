part of 'choose_verification_bloc.dart';

abstract class ChooseVerificationEvent extends Equatable {
  const ChooseVerificationEvent();
  @override
  List<Object> get props => [];
}


// for choose the type of verification
class VerificationByPhoneOrEmailEvent extends ChooseVerificationEvent{
  final bool byPhone;
  final bool byEmail;
  const VerificationByPhoneOrEmailEvent({required this.byPhone,required this.byEmail});
  @override
  List<Object> get props => [byPhone,byEmail];
}
