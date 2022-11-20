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
