import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/features/auth/presentation/pages/choose_verification_page/choose_verification_page.dart';
import 'package:be_to_be/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:be_to_be/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:be_to_be/features/be_to_be/prsentation/pages/be_to_be_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/choose_category.dart';
import 'package:be_to_be/features/company_information/presentation/pages/compant_information.dart';
import 'package:be_to_be/features/company_information/presentation/pages/company_position_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/google_map_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/more_address_info_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/refresh_page.dart';
import 'package:be_to_be/features/home/presntation/pages/home/main_page.dart';
import 'package:be_to_be/features/order/presentation/pages/order_page.dart';
import 'package:be_to_be/features/premium/presntation/pages/premium_page.dart';
import 'package:be_to_be/features/profile/presentation/pages/profile_page.dart';
import 'package:be_to_be/features/verification_account/presentation/pages/verification_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: LoginPage, initial: true),
    AutoRoute(path: '/register', page: RegisterPage, name: 'RegisterPage'),
    AutoRoute(
        path: '/chooseVerification',
        page: ChooseVerificationPage,
        name: 'ChooseVerificationPage'),
    AutoRoute(
        path: '/verification',
        page: VerificationPage,
        name: 'VerificationPage'),
    AutoRoute(
        path: '/companyInformation',
        page: CompanyInformationPage,
        name: 'CompanyInformationPage'),
    AutoRoute(
        path: '/companyPosition',
        page: CompanyPositionPage,
        name: 'ChoosePositionPage'),
    AutoRoute(
        path: '/morInfo',
        page: MoreAddressInfoPage,
        name: 'MoreInfoPage'),
    AutoRoute(
        path: '/googleMap',
        page: GoogleMapPage,
        name: 'GoogleMapPage'),
    AutoRoute(
        path: '/chooseCategory',
        page: ChooseCategoryPage,
        name: 'ChooseCategoryPage'),
    AutoRoute(
        path: '/refresh',
        page: RefreshPage,
        name: 'refreshPage'),
    AutoRoute(
        path: '/main',
        page: MainPage,
        name: 'mainPage'),
    AutoRoute(
        path: '/order',
        page: OrderPage,
        name: 'orderPage'),
    AutoRoute(
        path: '/profile',
        page: ProfilePage,
        name: 'profilePage'),
    AutoRoute(
        path: '/beToBe',
        page: BeToBePage,
        name: 'BeToBePage'),
    AutoRoute(
        path: '/premium',
        page: PremiumPage,
        name: 'premiumPage'),

  ],
)
class $AppRouter {}
