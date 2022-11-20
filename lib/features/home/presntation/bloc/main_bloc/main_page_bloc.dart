import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/be_to_be/prsentation/pages/be_to_be_page.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/domain/usecase/is_logged_usecase/is_logged_usecase.dart';
import 'package:be_to_be/features/order/presentation/pages/order_page.dart';
import 'package:be_to_be/features/premium/presntation/pages/premium_page.dart';
import 'package:be_to_be/features/profile/presentation/pages/profile_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  static MainPageBloc get(context) => BlocProvider.of(context);
  final IsLoggedUseCase isLoggedUseCase;


  String? roleId;
  IsLoggedEntity? isLoggedEntity;
  bool isShowSort = false;
  bool isPop = false;

  int currentIndex = 3;
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/premium.png', width: 30,)
        , label: 'Premium'
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/b2b.png', width: 30,)
        , label: 'B2B'
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/profile_img.png', width: 30,)
        , label: 'Profile'
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/order_1.png', width: 30,)
        , label: 'Order'
    ),
  ];
  List<Widget> screenOfBNB = [
    PremiumPage(),
    BeToBePage(),
    ProfilePage(),
    OrderPage()
  ];
  List<String>appBarTitle = [
    'Premium',
    'B2B',
    'Profile',
    'Order',
  ];


  MainPageBloc({
    required this.isLoggedUseCase,
  }) : super(MainPageInitial()) {
    on<MainPageEvent>((event, emit) async {
      ///
      /// here for BNB
      ///
      if (event is ChangeBottomNavigationBarEvent) {
        currentIndex = event.currentIndexPage;
        if (currentIndex == 0) {
          bottomNavItems[0] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/premium_1.png', width: 30,)
              , label: 'Premium'
          );
        } else {
          bottomNavItems[0] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/premium.png', width: 30,)
              , label: 'Premium'
          );
        }
        if (currentIndex == 1) {
          bottomNavItems[1] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/b2b_1.png', width: 30,)
              , label: 'B2B'
          );
        } else {
          bottomNavItems[1] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/b2b.png', width: 30,)
              , label: 'B2B'
          );
        }
        if (currentIndex == 2) {
          bottomNavItems[2] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile_img_1.png', width: 30,)
              , label: 'Profile'
          );
        } else {
          bottomNavItems[2] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile_img.png', width: 30,)
              , label: 'Profile'
          );
        }
        if (currentIndex == 3) {
          bottomNavItems[3] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/order_1.png', width: 30,)
              , label: 'Order'
          );
        } else {
          bottomNavItems[3] = BottomNavigationBarItem(
              icon: Image.asset('assets/images/order.png', width: 30,)
              , label: 'Order'
          );
        }


        print(currentIndex.toString());
        emit(ChangeBottomNavigationBarState(currentIndexPage: currentIndex));
      }

      ///
      /// here for is logged event
      ///
      if (event is IsLoggedEvent) {
        emit(LoadingIsLoggedState());

        final failureOrIsLogged = await isLoggedUseCase();

        failureOrIsLogged.fold(
                (failure) {
              emit(ErrorIsLoggedState(error: _mapFailureToMessage(failure)));
            },
                (isLogged) {
              roleId = isLogged.roleId;
              isLoggedEntity=IsLoggedEntity(roleId:isLogged. roleId, firstName:isLogged. firstName, lastName:isLogged. lastName, email:isLogged. email);
              print(roleId);

              emit(LoadedIsLoggedState());
            });
      }
      ///
      /// here for package popup event
      ///
        if(event is PackagePopupEvent){
          isPop= !isPop;
          emit(PackagePopupState(isPop: isPop));
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
