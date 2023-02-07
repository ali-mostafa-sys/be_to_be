part of 'upgrade_bloc.dart';

abstract class UpgradeEvent extends Equatable {
  const UpgradeEvent();
  @override
  List<Object> get props => [];
}
///
/// here for is selected container event
///
class IsSelectedContainerEvent extends UpgradeEvent{
  final int index;
  const IsSelectedContainerEvent({required this.index});
  @override
  List<Object> get props => [index];

}

///
/// here for get all package event
///
class GetAllPackageEvent extends UpgradeEvent{}


///
/// here for pop up
///

class ShowUpgradeDialogWidgetEvent extends UpgradeEvent{
  final int index;
  const ShowUpgradeDialogWidgetEvent({required this.index});
  @override
  List<Object> get props => [index];
}

///
/// here for post subscribe event
///

class PostSubscribeEvent extends UpgradeEvent{

  final SubscribeEntity subscribeEntity;
  const PostSubscribeEvent({required this.subscribeEntity});
  @override
  List<Object> get props => [subscribeEntity];
}




