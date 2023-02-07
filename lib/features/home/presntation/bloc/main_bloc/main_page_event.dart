part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object> get props => [];
}

///
/// here for change from premium to normal user
///
class NormalUserEvent extends MainPageEvent{}
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
/// here for change premium BNB event
///

class ChangePremiumBottomNavigationBarEvent extends MainPageEvent {
  final int currentPremiumIndexPage;

  const ChangePremiumBottomNavigationBarEvent({required this.currentPremiumIndexPage});

  @override
  List<Object> get props => [currentPremiumIndexPage];
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

///
/// here for sort event
///
class ShowBottomSheetSortEvent extends MainPageEvent{
  // final bool isShow;
  // const ShowBottomSheetSortEvent({required this.isShow});
  // @override
  // List<Object> get props => [isShow];
}

///
/// here for get user package used
///
class GetUserPackageUsedEvent extends MainPageEvent{}

///
/// here for show bottom sheet for add tender
///
class ShowBottomSheetAddTenderEvent extends MainPageEvent{}
///
/// here for choose tender on app
///
class ShowChooseTenderDialogEvent extends MainPageEvent{}


///
/// HERE FOR SORT EVENT
///
class SortButtonEvent extends MainPageEvent{
  final String sortValue;
  const SortButtonEvent({
    required this.sortValue
});
  @override
  List<Object> get props => [sortValue];
}


///
/// here for get setting event
///

class GetSettingEvent extends MainPageEvent{}




