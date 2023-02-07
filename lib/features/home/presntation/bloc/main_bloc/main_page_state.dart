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
/// here for normal user state
///
class NormalUserState extends MainPageState{
  final bool isPremium;
  const NormalUserState({required this.isPremium});
  @override
  List<Object> get props => [isPremium];
}
///
/// here for change BNB state
///

class ChangeBottomNavigationBarState extends MainPageState{
  final int currentIndexPage;
  const ChangeBottomNavigationBarState({required this.currentIndexPage});
  @override
  List<Object> get props => [currentIndexPage];
}
///
/// here for change premium BNB state
///
class ChangePremiumBottomNavigationBarState extends MainPageState{
  final int currentPremiumIndexPage;
  const ChangePremiumBottomNavigationBarState({required this.currentPremiumIndexPage});
  @override
  List<Object> get props => [currentPremiumIndexPage];
}

///
///  here for is logged state
///

class LoadingIsLoggedState extends MainPageState{}
class LoadedIsLoggedState extends MainPageState{
  final bool? chooseTender;
  const LoadedIsLoggedState({
    required this.chooseTender
});
  @override
  List<Object> get props => [chooseTender!];

}
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
///
/// here for bottom sheet show state
///
class ShowBottomSheetSortState extends MainPageState{
  final bool isShow ;
  const ShowBottomSheetSortState({required this.isShow});
  @override
  List<Object> get props => [isShow];

}
///
/// here for get user package used state
///
class LoadingGetUserPackageUsedState extends MainPageState{}
class LoadedGetUserPackageUsedState extends MainPageState{}
class ErrorGetUserPackageUsedState extends MainPageState{
  final String error;
  const ErrorGetUserPackageUsedState({required this.error});
  @override
  List<Object> get props => [error];
}

///
/// here for bottom sheet show state
///
class ShowBottomSheetAddTenderState extends MainPageState{
  final bool isShowAddTender ;
  const ShowBottomSheetAddTenderState({required this.isShowAddTender});
  @override
  List<Object> get props => [isShowAddTender];

}


///
/// here for show choose tender dialog
///
class ShowChooseTenderState extends MainPageState{
  final bool isPop;
  const ShowChooseTenderState({required this.isPop});
  @override
  List<Object> get props => [isPop];
}


///
/// here for sort button event
///
class SortButtonState extends MainPageState{
  final String sortValue;
  const SortButtonState({
    required this.sortValue
  });
  @override
  List<Object> get props => [sortValue];
}

///
/// here for get setting state
///

class LoadingGetSettingState extends MainPageState{}
class LoadedGetSettingState extends MainPageState{}
class ErrorGetSettingState extends MainPageState{
  final String error;
  const ErrorGetSettingState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}








