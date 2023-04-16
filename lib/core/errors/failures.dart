
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
class UnAcceptedAccountFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoToProfileFailure extends Failure {
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

/// here for order is empty failure
class OrderIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class MyOfferIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



/// tender is empty failure
class TenderIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OffersIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/// add tender failure
class AddTenderDailyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AddTenderMonthlyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/// her for notification is empty
class NotificationIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/// her for verification conflict
class VerificationConflictFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// here for be to be failure
class OffersOnTenderB2BIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/// here for choose tender my interests is empty

class MyInterestsIsEmptyFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}













