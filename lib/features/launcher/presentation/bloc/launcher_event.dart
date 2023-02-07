part of 'launcher_bloc.dart';

abstract class LauncherEvent extends Equatable {
  const LauncherEvent();
  @override
  List<Object> get props => [];
}

///
/// here for launcher event
///
class LauncherPageEvent extends LauncherEvent{}


