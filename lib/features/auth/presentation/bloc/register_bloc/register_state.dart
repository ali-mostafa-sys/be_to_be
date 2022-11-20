part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}



class ShowPhoneDialogState extends RegisterState{
  final bool isPop;
  const ShowPhoneDialogState({required this.isPop});
  @override
  List<Object> get props => [isPop];
}
// for alert dialog popup
class OnPhoneNextButtonState extends RegisterState{
  final String phoneValue;
  const OnPhoneNextButtonState({required this.phoneValue});
  @override
  List<Object> get props => [phoneValue];
}

// for choose gender and has whats up
class ChooseGenderState extends RegisterState{
  final String gender;
  const ChooseGenderState({required this.gender});
  @override
  List<Object> get props => [gender];
}

class ChooseHasPhoneState extends RegisterState{
  final bool hasPhone;
  const ChooseHasPhoneState({required this.hasPhone});
  @override
  List<Object> get props => [hasPhone];
}

// here for obSecure  password and confirm password

class ChangeObSecurePasswordState extends RegisterState{
  final bool obSecure;
  const ChangeObSecurePasswordState({required this.obSecure});
  @override
  List<Object> get props => [obSecure];
}

/// here  for register state

class LoadingRegisterState extends RegisterState{}
class LoadedRegisterState extends RegisterState{}
class ErrorRegisterState extends RegisterState{
  final String error;
  const ErrorRegisterState({required this.error});
  @override
  List<Object> get props => [error];
}



