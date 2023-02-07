part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();
  @override
  List<Object> get props => [];
}

class VerificationInitial extends VerificationState {
  @override
  List<Object> get props => [];
}

class OnOpeningVerificationPageState extends VerificationState{}
class OnOpenVerificationPageState extends VerificationState{}

///
/// here for OTP code state
///
class LoadingGetOTPCodeState extends  VerificationState{}
class LoadedGetOTPCodeState extends  VerificationState{}
class ErrorGetOTPCodeState extends  VerificationState{
  final String error;
  const ErrorGetOTPCodeState({
    required this.error
});
  @override
  List<Object> get props => [error];
}


///
/// here for send OTP code state
///
class LoadingSendOTPCodeState extends  VerificationState{}
class LoadedSendOTPCodeState extends  VerificationState{}
class ErrorSendOTPCodeState extends  VerificationState{
  final String error;
  const ErrorSendOTPCodeState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}






