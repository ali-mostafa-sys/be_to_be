
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// login failure

class InvalidEmailAndPasswordFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class AccountNotVerificationFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


/// register failure

class DuplicateUserFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InvalidEmailFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InvalidMobileFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}





























