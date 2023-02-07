import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/features/about_us/presentation/pages/about_us.dart';
import 'package:be_to_be/features/add_tender/presentation/pages/add_tender_page.dart';
import 'package:be_to_be/features/auth/presentation/pages/choose_verification_page/choose_verification_page.dart';
import 'package:be_to_be/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:be_to_be/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:be_to_be/features/be_to_be/prsentation/pages/be_to_be_page.dart';
import 'package:be_to_be/features/chooase_tender/presentation/pages/choose_tender_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/choose_category.dart';
import 'package:be_to_be/features/company_information/presentation/pages/compant_information.dart';
import 'package:be_to_be/features/company_information/presentation/pages/company_position_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/google_map_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/more_address_info_page.dart';
import 'package:be_to_be/features/company_information/presentation/pages/refresh_page.dart';
import 'package:be_to_be/features/contact_us/presentation/pages/contact_us.dart';
import 'package:be_to_be/features/create_tender/presentation/page/create_tender_page.dart';
import 'package:be_to_be/features/faq/presentation/pages/faq_page.dart';
import 'package:be_to_be/features/history/presentation/pages/history_page.dart';
import 'package:be_to_be/features/home/presntation/pages/home/main_page.dart';
import 'package:be_to_be/features/launcher/presentation/pages/launcher_page.dart';
import 'package:be_to_be/features/notification/presentation/page/notifications_page.dart';
import 'package:be_to_be/features/offers/presentation/pages/offer_page.dart';
import 'package:be_to_be/features/order/presentation/pages/order_page.dart';
import 'package:be_to_be/features/premium/presntation/pages/premium_page.dart';
import 'package:be_to_be/features/privacy/presentation/pages/privacy_page.dart';
import 'package:be_to_be/features/profile/presentation/pages/profile_page.dart';
import 'package:be_to_be/features/terms/presentation/pages/terms_page.dart';
import 'package:be_to_be/features/upgrade/presentation/pages/upgrade_page.dart';
import 'package:be_to_be/features/verification_account/presentation/pages/verification_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: LauncherPage, initial: true),
    AutoRoute(path: '/register', page: RegisterPage, name: 'RegisterPage'),
    AutoRoute(
        path: '/login',
        page: LoginPage,
        name: 'LoginPage'),
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
    AutoRoute(
        path: '/offer',
        page: OfferPage,
        name: 'OfferPage'),
    AutoRoute(
        path: '/upgrade',
        page: UpgradePage,
        name: 'UpgradePage'),
    AutoRoute(
        path: '/addTender',
        page: AddTenderPage,
        name: 'AddTenderPage'),
    AutoRoute(
        path: '/chooseTender',
        page: ChooseTenderPage,
        name: 'ChooseTenderPage'),
    AutoRoute(
        path: '/createTender',
        page: CreateTenderPage,
        name: 'CreateTenderPage'),
    AutoRoute(
        path: '/notification',
        page: NotificationPage,
        name: 'NotificationPage'),
    AutoRoute(
        path: '/history',
        page: HistoryPage,
        name: 'HistoryPage'),
    ///here for drawer
    AutoRoute(
        path: '/terms',
        page: TermsPage,
        name: 'TermsPage'),
    AutoRoute(
        path: '/aboutUs',
        page: AboutUsPage,
        name: 'AboutUsPage'),
    AutoRoute(
        path: '/contactUs',
        page: ContactUsPage,
        name: 'ContactUsPage'),
    AutoRoute(
        path: '/privacy',
        page: PrivacyPage,
        name: 'PrivacyPage'),
    AutoRoute(
        path: '/faq',
        page: FAQPage,
        name: 'FAQPage'),

  ],
)
class $AppRouter {}
