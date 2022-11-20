part of 'main_page_bloc.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();
  @override
  List<Object> get props => [];
}

class MainPageInitial extends MainPageState {

  @override
  List<Object> get props => [];
}

///
/// here for change BNB event
///

class ChangeBottomNavigationBarState extends MainPageState{
  final int currentIndexPage;
  const ChangeBottomNavigationBarState({required this.currentIndexPage});
  @override
  List<Object> get props => [currentIndexPage];
}
///
///  here for is logged state
///

class LoadingIsLoggedState extends MainPageState{}
class LoadedIsLoggedState extends MainPageState{}
class ErrorIsLoggedState extends MainPageState{
  final String error;
  const ErrorIsLoggedState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// here for package popup state
///

class PackagePopupState extends MainPageState{
  final bool isPop;
  const PackagePopupState({required this.isPop});
  @override
  List<Object> get props => [isPop];
}
























