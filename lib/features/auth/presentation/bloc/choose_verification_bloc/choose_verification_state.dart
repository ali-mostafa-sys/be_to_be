part of 'choose_verification_bloc.dart';

abstract class ChooseVerificationState extends Equatable {
  const ChooseVerificationState();
  @override
  List<Object> get props => [];
}

class ChooseVerificationInitial extends ChooseVerificationState {
  @override
  List<Object> get props => [];
}

// for choose the type of verification

class VerificationByPhoneOrEmailState extends ChooseVerificationState{
  final bool byPhone;
  final bool byEmail;
  const VerificationByPhoneOrEmailState({required this.byPhone,required this.byEmail});
  @override
  List<Object> get props => [byPhone,byEmail];
}