import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/add_tender/presentation/pages/add_tender_page.dart';
import 'package:be_to_be/features/be_to_be/prsentation/pages/be_to_be_page.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/domain/entiy/package_used_entity/package_used_entity.dart';
import 'package:be_to_be/features/home/domain/usecase/get_package_used_usecase/get_package_used_usecase.dart';
import 'package:be_to_be/features/home/domain/usecase/get_setting_usecase/get_setting_usecase.dart';
import 'package:be_to_be/features/home/domain/usecase/is_logged_usecase/is_logged_usecase.dart';
import 'package:be_to_be/features/offers/presentation/pages/offer_page.dart';
import 'package:be_to_be/features/order/presentation/pages/order_page.dart';
import 'package:be_to_be/features/premium/presntation/pages/premium_page.dart';
import 'package:be_to_be/features/profile/presentation/pages/profile_page.dart';
import 'package:be_to_be/features/upgrade/presentation/pages/upgrade_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  static MainPageBloc get(context) => BlocProvider.of(context);
  final IsLoggedUseCase isLoggedUseCase;
  final GetPackageUsedUseCase getPackageUsedUseCase;
  final SharedPreferences sharedPreferences;
  final GetSettingUseCase getSettingUseCase;

  /// here for chooase tender

  bool? chooseTender;

  /// here for user package used
  String packageName = '';
  int remainingTender = 0;
  int dayTender = 0;
  String packageValidate = '';
  int isActive = 0;

  String? roleId;
  IsLoggedEntity? isLoggedEntity;
  bool isShowSort = false;
  bool isAddTender = false;
  bool isPop = false;

  /// here for normal user
  bool isPremium = false;
  int currentIndex = 3;

  /// here for premium
  int currentIndexPremium = 2;
  List<BottomNavigationBarItem> bottomNavPremiumItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/profile_img.png',
          width: 30,
        ),
        label: 'Profile'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/offer.png',
          width: 30,
        ),
        label: 'My Orders'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/b2b.png',
          width: 30,
        ),
        label: 'B2B'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/order.png',
          width: 30,
        ),
        label: 'Tenders'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        label: 'Create'),
  ];

  List<Widget> screenOfPremiumBNB = [
    ProfilePage(),
    OfferPage(),
    BeToBePage(),
    OrderPage(),
    AddTenderPage()
  ];
  List<String> premiumAppBarTitle = [
    'Profile',
    'My Orders',
    'B2B',
    'Tenders',
    'Create Tender',
  ];

  /// here for normal user
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/premium.png',
          width: 30,
        ),
        label: 'Premium'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/b2b.png',
          width: 30,
        ),
        label: 'B2B'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/profile_img.png',
          width: 30,
        ),
        label: 'Profile'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/order_1.png',
          width: 30,
        ),
        label: 'Order'),
  ];
  List<Widget> screenOfBNB = [
    PremiumPage(),
    BeToBePage(),
    ProfilePage(),
    OrderPage()
  ];
  List<String> appBarTitle = [
    'Premium',
    'B2B',
    'Profile',
    'Order',
  ];

  /// here for package data
  PackageUsedEntity? packageUsedEntity;

  int tenderDurationInSeconds = 0;
  int maxTimeForAcceptOfferInSeconds = 0;
/// here for change bottom nave bar when page is create
  bool createPage=false;
  MainPageBloc({
    required this.isLoggedUseCase,
    required this.getPackageUsedUseCase,
    required this.sharedPreferences,
    required this.getSettingUseCase,
  }) : super(MainPageInitial()) {
    on<MainPageEvent>((event, emit) async {

      ///
      /// here for leave create page event
      ///
      if(event is AcceptLeaveCreatePageEvent){
        createPage=false;
        emit(CreatePageState(createPage: createPage));

      }


      ///
      /// here for get setting
      ///
      if (event is GetSettingEvent) {
        emit(LoadingGetSettingState());

        final failureOrGetSetting = await getSettingUseCase();
        failureOrGetSetting.fold((failure) {
          emit(ErrorGetSettingState(error: _mapFailureToMessage(failure)));
        }, (setting) {
          setting.map((e) {
            if (e.nameEn == 'Max Time For Accept Offer In Seconds') {
              maxTimeForAcceptOfferInSeconds = int.parse(e.value);
            }
            if (e.nameEn == 'Max Tender Duration In Seconds') {
              tenderDurationInSeconds = int.parse(e.value);
            }
          }).toList();

          emit(LoadedGetSettingState());
        });
      }

      ///
      /// here for change user type event
      ///
      if (event is NormalUserEvent) {
        // if(isPremium==)
        isPremium = !isPremium;
        emit(NormalUserState(isPremium: isPremium));
      }

      ///
      /// here for BNB
      ///
      if (event is ChangeBottomNavigationBarEvent) {
        currentIndex = event.currentIndexPage;
        if (currentIndex == 0) {
          bottomNavItems[0] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/premium_1.png',
                width: 30,
              ),
              label: 'Premium');
        } else {
          bottomNavItems[0] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/premium.png',
                width: 30,
              ),
              label: 'Premium');
        }
        if (currentIndex == 1) {
          bottomNavItems[1] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/b2b_1.png',
                width: 30,
              ),
              label: 'B2B');
        } else {
          bottomNavItems[1] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/b2b.png',
                width: 30,
              ),
              label: 'B2B');
        }
        if (currentIndex == 2) {
          bottomNavItems[2] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile_img_1.png',
                width: 30,
              ),
              label: 'Profile');
        } else {
          bottomNavItems[2] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile_img.png',
                width: 30,
              ),
              label: 'Profile');
        }
        if (currentIndex == 3) {
          bottomNavItems[3] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/order_1.png',
                width: 30,
              ),
              label: 'Order');
        } else {
          bottomNavItems[3] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/order.png',
                width: 30,
              ),
              label: 'Order');
        }
        emit(ChangeBottomNavigationBarState(currentIndexPage: currentIndex));
      }

      ///
      /// here for premium BNB
      ///
      if (event is ChangePremiumBottomNavigationBarEvent) {




        if(event.currentPremiumIndexPage==4){
          createPage==true;

        }
        emit(CreatePageState(createPage: createPage));
        if(createPage==false){
          currentIndexPremium = event.currentPremiumIndexPage;
        }


        if (currentIndexPremium == 0) {
          bottomNavPremiumItems[0] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile_img_1.png',
                width: 30,
              ),
              label: 'Profile');
        } else {
          bottomNavPremiumItems[0] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile_img.png',
                width: 30,
              ),
              label: 'Profile');
        }
        if (currentIndexPremium == 1) {
          bottomNavPremiumItems[1] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/offer_1.png',
                width: 30,
              ),
              label: 'My Orders');
        } else {
          bottomNavPremiumItems[1] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/offer.png',
                width: 30,
              ),
              label: 'My Orders');
        }
        if (currentIndexPremium == 2) {
          bottomNavPremiumItems[2] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/b2b_1.png',
                width: 30,
              ),
              label: 'B2B');
        } else {
          bottomNavPremiumItems[2] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/b2b.png',
                width: 30,
              ),
              label: 'B2B');
        }
        if (currentIndexPremium == 3) {
          bottomNavPremiumItems[3] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/order_1.png',
                width: 30,
              ),
              label: 'Tenders');
        } else {
          bottomNavPremiumItems[3] = BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/order.png',
                width: 30,
              ),
              label: 'Tenders');
        }
        if (currentIndexPremium == 4) {

          bottomNavPremiumItems[4] = const BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              label: 'Create');
        } else {
          bottomNavPremiumItems[4] = const BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              label: 'Create');
        }

        print(createPage);




        emit(ChangePremiumBottomNavigationBarState(
            currentPremiumIndexPage: currentIndexPremium));
      }

      ///
      /// here for is logged event
      ///
      if (event is IsLoggedEvent) {
        emit(LoadingIsLoggedState());

        final failureOrIsLogged = await isLoggedUseCase();

        failureOrIsLogged.fold((failure) {
          emit(ErrorIsLoggedState(error: _mapFailureToMessage(failure)));
        }, (isLogged) {
          chooseTender = sharedPreferences.getBool('chooseTender');
          roleId = isLogged.roleId;
          isLoggedEntity = IsLoggedEntity(
              idUser: isLogged.idUser,
              roleId: isLogged.roleId,
              firstName: isLogged.firstName,
              lastName: isLogged.lastName,
              email: isLogged.email);

          emit(LoadedIsLoggedState(chooseTender: chooseTender));
        });
      }

      ///
      /// here for package popup event
      ///
      if (event is PackagePopupEvent) {
        isPop = !isPop;
        emit(PackagePopupState(isPop: isPop));
      }

      ///
      /// here for get user package used
      ///
      if (event is GetUserPackageUsedEvent) {
        emit(LoadingGetUserPackageUsedState());
        final failureOrGetPackageUsed = await getPackageUsedUseCase();

        failureOrGetPackageUsed.fold((failure) {
          emit(ErrorGetUserPackageUsedState(
              error: _mapFailureToMessage(failure)));
        }, (packageUsed) {
          packageName = packageUsed.subscriptionPackageName;

          remainingTender =
              packageUsed.monthAllowTenderCnt - packageUsed.monthCreatTenderCnt;
          dayTender =
              packageUsed.dayAllowTenderCnt - packageUsed.dayCreatTenderCnt;
          isActive = packageUsed.isActive;

          final date = DateTime.parse(packageUsed.expireAt)
              .difference(DateTime.now())
              .inDays
              .toString();
          final day = int.parse(date);
          final month = day / 30;
          final k = month.toInt();

          packageValidate = k.toString();

          packageUsedEntity = PackageUsedEntity(
              subscriptionPackageName: packageUsed.subscriptionPackageName,
              monthAllowTenderCnt: packageUsed.monthAllowTenderCnt,
              monthCreatTenderCnt: packageUsed.monthCreatTenderCnt,
              dayAllowTenderCnt: packageUsed.dayAllowTenderCnt,
              dayCreatTenderCnt: packageUsed.dayCreatTenderCnt,
              expireAt: packageUsed.expireAt,
              isActive: packageUsed.isActive);
        });
      }

      ///
      /// here for sort
      ///
      if (event is ShowBottomSheetSortEvent) {
        isShowSort = !isShowSort;
        emit(ShowBottomSheetSortState(isShow: isShowSort));
      }

      ///
      /// here for bottom sheet add tender
      ///
      if (event is ShowBottomSheetAddTenderEvent) {
        isAddTender = !isAddTender;
        emit(ShowBottomSheetAddTenderState(isShowAddTender: isAddTender));
      }

      ///
      /// here for sort button event
      ///
      if (event is SortButtonEvent) {
        emit(SortButtonState(sortValue: event.sortValue));
      }

      ///
      /// here for logout event
      ///
      if (event is LogeOutHomeEvent) {
        await sharedPreferences.remove('cookies');
        await sharedPreferences.remove('userId');
        emit(LogOutHomeState());
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
