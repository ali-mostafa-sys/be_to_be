part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}


class OnPhoneFieldTapEvent extends RegisterEvent{}
// for alert dialog popup
class OnPhoneNextButtonEvent extends RegisterEvent{
  final String phoneNumber;
 const  OnPhoneNextButtonEvent({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}

// for choose gender and has whats up
class ChooseGenderEvent extends RegisterEvent{
  final String gender;
  const ChooseGenderEvent({required this.gender});
  @override
  List<Object> get props => [gender];
}

class ChooseHasPhoneEvent extends RegisterEvent{
  final bool hasPhone;
  const ChooseHasPhoneEvent({required this.hasPhone});
  @override
  List<Object> get props => [hasPhone];
}
// here for obSecure password and confirm password
class ChangeObSecurePasswordEvent extends RegisterEvent{

}

/// here for register event

class RegisterButtonEvent extends RegisterEvent{
  final RegisterEntity registerEntity;
  const RegisterButtonEvent({required this.registerEntity});
  @override
  List<Object> get props => [registerEntity];
}





