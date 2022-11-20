// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../../features/auth/presentation/pages/choose_verification_page/choose_verification_page.dart'
    as _i3;
import '../../features/auth/presentation/pages/login_page/login_page.dart'
    as _i1;
import '../../features/auth/presentation/pages/register_page/register_page.dart'
    as _i2;
import '../../features/be_to_be/prsentation/pages/be_to_be_page.dart' as _i14;
import '../../features/company_information/presentation/pages/choose_category.dart'
    as _i9;
import '../../features/company_information/presentation/pages/compant_information.dart'
    as _i5;
import '../../features/company_information/presentation/pages/company_position_page.dart'
    as _i6;
import '../../features/company_information/presentation/pages/google_map_page.dart'
    as _i8;
import '../../features/company_information/presentation/pages/more_address_info_page.dart'
    as _i7;
import '../../features/company_information/presentation/pages/refresh_page.dart'
    as _i10;
import '../../features/home/presntation/pages/home/main_page.dart' as _i11;
import '../../features/order/presentation/pages/order_page.dart' as _i12;
import '../../features/premium/presntation/pages/premium_page.dart' as _i15;
import '../../features/profile/presentation/pages/profile_page.dart' as _i13;
import '../../features/verification_account/presentation/pages/verification_page.dart'
    as _i4;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage(key: args.key));
    },
    RegisterPage.name: (routeData) {
      final args = routeData.argsAs<RegisterPageArgs>(
          orElse: () => const RegisterPageArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RegisterPage(key: args.key));
    },
    ChooseVerificationPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ChooseVerificationPage());
    },
    VerificationPage.name: (routeData) {
      final args = routeData.argsAs<VerificationPageArgs>(
          orElse: () => const VerificationPageArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.VerificationPage(key: args.key));
    },
    CompanyInformationPage.name: (routeData) {
      final args = routeData.argsAs<CompanyInformationPageArgs>(
          orElse: () => const CompanyInformationPageArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.CompanyInformationPage(key: args.key));
    },
    ChoosePositionPage.name: (routeData) {
      final args = routeData.argsAs<ChoosePositionPageArgs>(
          orElse: () => const ChoosePositionPageArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.CompanyPositionPage(key: args.key));
    },
    MoreInfoPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child:  _i7.MoreAddressInfoPage());
    },
    GoogleMapPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.GoogleMapPage());
    },
    ChooseCategoryPage.name: (routeData) {
      final args = routeData.argsAs<ChooseCategoryPageArgs>(
          orElse: () => const ChooseCategoryPageArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.ChooseCategoryPage(key: args.key));
    },
    RefreshPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.RefreshPage());
    },
    MainPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child:  _i11.MainPage());
    },
    OrderPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.OrderPage());
    },
    ProfilePage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child:  _i13.ProfilePage());
    },
    BeToBePage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.BeToBePage());
    },
    PremiumPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.PremiumPage());
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(LoginRoute.name, path: '/'),
        _i16.RouteConfig(RegisterPage.name, path: '/register'),
        _i16.RouteConfig(ChooseVerificationPage.name,
            path: '/chooseVerification'),
        _i16.RouteConfig(VerificationPage.name, path: '/verification'),
        _i16.RouteConfig(CompanyInformationPage.name,
            path: '/companyInformation'),
        _i16.RouteConfig(ChoosePositionPage.name, path: '/companyPosition'),
        _i16.RouteConfig(MoreInfoPage.name, path: '/morInfo'),
        _i16.RouteConfig(GoogleMapPage.name, path: '/googleMap'),
        _i16.RouteConfig(ChooseCategoryPage.name, path: '/chooseCategory'),
        _i16.RouteConfig(RefreshPage.name, path: '/refresh'),
        _i16.RouteConfig(MainPage.name, path: '/main'),
        _i16.RouteConfig(OrderPage.name, path: '/order'),
        _i16.RouteConfig(ProfilePage.name, path: '/profile'),
        _i16.RouteConfig(BeToBePage.name, path: '/beToBe'),
        _i16.RouteConfig(PremiumPage.name, path: '/premium')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i17.Key? key})
      : super(LoginRoute.name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterPage extends _i16.PageRouteInfo<RegisterPageArgs> {
  RegisterPage({_i17.Key? key})
      : super(RegisterPage.name,
            path: '/register', args: RegisterPageArgs(key: key));

  static const String name = 'RegisterPage';
}

class RegisterPageArgs {
  const RegisterPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'RegisterPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ChooseVerificationPage]
class ChooseVerificationPage extends _i16.PageRouteInfo<void> {
  const ChooseVerificationPage()
      : super(ChooseVerificationPage.name, path: '/chooseVerification');

  static const String name = 'ChooseVerificationPage';
}

/// generated route for
/// [_i4.VerificationPage]
class VerificationPage extends _i16.PageRouteInfo<VerificationPageArgs> {
  VerificationPage({_i17.Key? key})
      : super(VerificationPage.name,
            path: '/verification', args: VerificationPageArgs(key: key));

  static const String name = 'VerificationPage';
}

class VerificationPageArgs {
  const VerificationPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'VerificationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CompanyInformationPage]
class CompanyInformationPage
    extends _i16.PageRouteInfo<CompanyInformationPageArgs> {
  CompanyInformationPage({_i17.Key? key})
      : super(CompanyInformationPage.name,
            path: '/companyInformation',
            args: CompanyInformationPageArgs(key: key));

  static const String name = 'CompanyInformationPage';
}

class CompanyInformationPageArgs {
  const CompanyInformationPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'CompanyInformationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.CompanyPositionPage]
class ChoosePositionPage extends _i16.PageRouteInfo<ChoosePositionPageArgs> {
  ChoosePositionPage({_i17.Key? key})
      : super(ChoosePositionPage.name,
            path: '/companyPosition', args: ChoosePositionPageArgs(key: key));

  static const String name = 'ChoosePositionPage';
}

class ChoosePositionPageArgs {
  const ChoosePositionPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'ChoosePositionPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.MoreAddressInfoPage]
class MoreInfoPage extends _i16.PageRouteInfo<void> {
  const MoreInfoPage() : super(MoreInfoPage.name, path: '/morInfo');

  static const String name = 'MoreInfoPage';
}

/// generated route for
/// [_i8.GoogleMapPage]
class GoogleMapPage extends _i16.PageRouteInfo<void> {
  const GoogleMapPage() : super(GoogleMapPage.name, path: '/googleMap');

  static const String name = 'GoogleMapPage';
}

/// generated route for
/// [_i9.ChooseCategoryPage]
class ChooseCategoryPage extends _i16.PageRouteInfo<ChooseCategoryPageArgs> {
  ChooseCategoryPage({_i17.Key? key})
      : super(ChooseCategoryPage.name,
            path: '/chooseCategory', args: ChooseCategoryPageArgs(key: key));

  static const String name = 'ChooseCategoryPage';
}

class ChooseCategoryPageArgs {
  const ChooseCategoryPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'ChooseCategoryPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.RefreshPage]
class RefreshPage extends _i16.PageRouteInfo<void> {
  const RefreshPage() : super(RefreshPage.name, path: '/refresh');

  static const String name = 'RefreshPage';
}

/// generated route for
/// [_i11.MainPage]
class MainPage extends _i16.PageRouteInfo<void> {
  const MainPage() : super(MainPage.name, path: '/main');

  static const String name = 'MainPage';
}

/// generated route for
/// [_i12.OrderPage]
class OrderPage extends _i16.PageRouteInfo<void> {
  const OrderPage() : super(OrderPage.name, path: '/order');

  static const String name = 'OrderPage';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfilePage extends _i16.PageRouteInfo<void> {
  const ProfilePage() : super(ProfilePage.name, path: '/profile');

  static const String name = 'ProfilePage';
}

/// generated route for
/// [_i14.BeToBePage]
class BeToBePage extends _i16.PageRouteInfo<void> {
  const BeToBePage() : super(BeToBePage.name, path: '/beToBe');

  static const String name = 'BeToBePage';
}

/// generated route for
/// [_i15.PremiumPage]
class PremiumPage extends _i16.PageRouteInfo<void> {
  const PremiumPage() : super(PremiumPage.name, path: '/premium');

  static const String name = 'PremiumPage';
}
