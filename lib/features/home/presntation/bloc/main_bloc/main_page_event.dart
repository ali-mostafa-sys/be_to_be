part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object> get props => [];
}



///
/// here for change BNB event
///
class ChangeBottomNavigationBarEvent extends MainPageEvent {
  final int currentIndexPage;

  const ChangeBottomNavigationBarEvent({required this.currentIndexPage});

  @override
  List<Object> get props => [currentIndexPage];
}

///
/// HERE FOR IS LOGGED EVENT
///
class IsLoggedEvent extends MainPageEvent {

}
///
/// here for package popup
///
class PackagePopupEvent extends MainPageEvent{

}

