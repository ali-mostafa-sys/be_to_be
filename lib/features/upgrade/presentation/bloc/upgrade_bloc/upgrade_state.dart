part of 'upgrade_bloc.dart';

abstract class UpgradeState extends Equatable {
  const UpgradeState();
  @override
  List<Object> get props => [];
}

class UpgradeInitial extends UpgradeState {
  @override
  List<Object> get props => [];
}


///
/// here for is selected container
///
class IsSelectedContainerState extends UpgradeState{
  final bool isSelected;
  const IsSelectedContainerState({required this.isSelected});
  @override
  List<Object> get props => [isSelected];

}
///
/// here for get all package state
///
class LoadingGetAllPackageState extends UpgradeState{}
class LoadedGetAllPackageState extends UpgradeState{}
class ErrorGetAllPackageState extends UpgradeState{
  final String error;
  const ErrorGetAllPackageState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// here for show upgrade dialog state
///
class OnShowUpgradeDialogState extends UpgradeState{
  final bool isPop;
  final int subscriptionPackageId;
  const OnShowUpgradeDialogState({required this.isPop,required this.subscriptionPackageId});
  @override
  List<Object> get props => [isPop];
}
///
/// here for subscribe state
///

class LoadingPostSubscribeState extends UpgradeState{}
class LoadedPostSubscribeState extends UpgradeState{}
class ErrorPostSubscribeState extends UpgradeState{
  final String error;
  const ErrorPostSubscribeState({
    required this.error
});
  @override
  List<Object> get props => [error];
}














