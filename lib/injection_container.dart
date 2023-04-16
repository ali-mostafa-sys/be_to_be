
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/about_us/data/data_source/about_us_remote_data_source.dart';
import 'package:be_to_be/features/about_us/data/repositories/about_us_repositories.dart';
import 'package:be_to_be/features/about_us/domain/repositories/about_us_repositories.dart';
import 'package:be_to_be/features/about_us/domain/usecase/get_about_us_usecase.dart';
import 'package:be_to_be/features/about_us/presentation/bloc/about_us_bloc.dart';
import 'package:be_to_be/features/add_tender/data/data_source/add_tender_remote_data_source/add_tender_remote_data_source.dart';
import 'package:be_to_be/features/add_tender/data/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/add_tender_usecase/add_tender_usecse.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_all_cities_add_tender_usecase/get_all_cities_add_tender_usecase.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_all_product_usecase/get_all_product_usecase.dart';
import 'package:be_to_be/features/add_tender/domain/usecase/get_countries_usecase/get_countries_usecase.dart';
import 'package:be_to_be/features/add_tender/presentation/bloc/add_tender/add_tender_bloc.dart';
import 'package:be_to_be/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:be_to_be/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:be_to_be/features/auth/domain/usecase/get_code_forget_password_usecase.dart';
import 'package:be_to_be/features/auth/domain/usecase/login_usecase.dart';
import 'package:be_to_be/features/auth/domain/usecase/post_new_password_usecase.dart';
import 'package:be_to_be/features/auth/domain/usecase/register_usecase.dart';
import 'package:be_to_be/features/auth/presentation/bloc/choose_verification_bloc/choose_verification_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/be_to_be/data/data_source/be_to_be_remote_data_source/be_to_be_remote_data_source.dart';
import 'package:be_to_be/features/be_to_be/data/repositories/be_to_be_repositories/be_to_be_repositories.dart';
import 'package:be_to_be/features/be_to_be/domain/repositories/be_to_be_repositories/be_to_be_repositories.dart';
import 'package:be_to_be/features/be_to_be/domain/use_case/get_be_to_be_data/get_be_tobe_data.dart';
import 'package:be_to_be/features/be_to_be/domain/use_case/get_offers_on_tender_b2b_usecase/get_offers_on_tender_b2b_usecase.dart';
import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/chooase_tender/data/data_source/choose_tender_data_cource/choose_tender_remot_data_source.dart';
import 'package:be_to_be/features/chooase_tender/data/repositories/choose_tender_repositories.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_brand_usecase/get_brand_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_categories_usecase/get_categories_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_my_interests_usecase/get_my_interests_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_pruduct_usecase/get_produts_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/post_care_usecase/post_care_usecase.dart';
import 'package:be_to_be/features/chooase_tender/presentation/bloc/choose_tender_bloc.dart';
import 'package:be_to_be/features/company_information/data/data_source/company_info_remote_data_source/company_info_remote_data_source.dart';
import 'package:be_to_be/features/company_information/data/rpositories/company_info_repositories_impl.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:be_to_be/features/company_information/domain/usecase/add_company_usecase/add_company_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_cities_usecase/get_all_cities_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_company_type_usecase/get_all_company_type_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_country_usecase/get_al_country_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/uploadImage_usecase/upload_image_usecase.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:be_to_be/features/contact_us/data/repositories/contact_us_repositories.dart';
import 'package:be_to_be/features/contact_us/domain/repositories/contact_us_repositories.dart';
import 'package:be_to_be/features/contact_us/domain/usecase/get_contact_us_usecase.dart';
import 'package:be_to_be/features/contact_us/presentation/bloc/contact_us_bloc.dart';
import 'package:be_to_be/features/create_tender/data/data_source/create_tender_remote_data_source/create_tender_remote_data_source.dart';
import 'package:be_to_be/features/create_tender/data/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/add_brand_usecase/add_brand_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/add_product_usecase/add_product_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/get_brands_usecase/get_create_tender_brands_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/get_categories_usecase/get_create_tender_categories_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/upload_ct_image_usecase/upload_ct_image_usecase.dart';
import 'package:be_to_be/features/create_tender/presentation/bloc/create_tender_bloc.dart';
import 'package:be_to_be/features/faq/data/data_source/fqa_remote_data_source.dart';
import 'package:be_to_be/features/faq/data/repositories/fqa_repositories.dart';
import 'package:be_to_be/features/faq/domain/repositories/fqa_repositories.dart';
import 'package:be_to_be/features/faq/domain/usecase/fqa_usecase.dart';
import 'package:be_to_be/features/faq/presentation/bloc/faq_bloc.dart';
import 'package:be_to_be/features/history/data/data_source/history_remote_data_source/history_remote_data_source.dart';
import 'package:be_to_be/features/history/data/repositories/history_repositories/history_repositories.dart';
import 'package:be_to_be/features/history/domain/repositories/hestory_repositories/hestory_repositories.dart';
import 'package:be_to_be/features/history/domain/usecase/get_order_h_usecase/get_order_h_usecase.dart';
import 'package:be_to_be/features/history/domain/usecase/get_tender_h_usecase/get_tender_h_usecase.dart';
import 'package:be_to_be/features/history/presentation/bloc/history_bloc.dart';
import 'package:be_to_be/features/home/data/data_source/remote_main_data_source/remote_main_data_source.dart';
import 'package:be_to_be/features/home/data/repositories/main_repositories_impl.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:be_to_be/features/home/domain/usecase/get_package_used_usecase/get_package_used_usecase.dart';
import 'package:be_to_be/features/home/domain/usecase/get_setting_usecase/get_setting_usecase.dart';
import 'package:be_to_be/features/home/domain/usecase/is_logged_usecase/is_logged_usecase.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/launcher/data/data_source/launcher_remote_data_source.dart';
import 'package:be_to_be/features/launcher/data/repositories/launcher_repositories.dart';
import 'package:be_to_be/features/launcher/domain/repositories/launcher_cities_repositories.dart';
import 'package:be_to_be/features/launcher/domain/usecase/get_cities_usecase/get_luancher_cities_usecase.dart';
import 'package:be_to_be/features/launcher/presentation/bloc/launcher_bloc.dart';
import 'package:be_to_be/features/more_info/data/data_source/more_info_remote_data_source/more_remote_data_source.dart';
import 'package:be_to_be/features/more_info/data/repositories/more_info_repository/more_info_repository.dart';
import 'package:be_to_be/features/more_info/domain/repositories/more_info_b2b_repositories/more_info_b2b_repositories.dart';
import 'package:be_to_be/features/more_info/domain/usecase/get_offer_owner_info_usecase/get_offer_owner_info_usecase.dart';
import 'package:be_to_be/features/more_info/domain/usecase/get_tender_owner_info_usecase/get_tender_owner_info_usecase.dart';
import 'package:be_to_be/features/more_info/domain/usecase/post_offer_executed_usecase/post_offer_executed_usecase.dart';
import 'package:be_to_be/features/more_info/presentation/bloc/more_info_b2b_bloc.dart';
import 'package:be_to_be/features/notification/data/data_source/notification_remote_data_source/notification_remote_data_source.dart';
import 'package:be_to_be/features/notification/data/repositories/notification_repositories.dart';
import 'package:be_to_be/features/notification/domain/repositories/notification_repositories.dart';
import 'package:be_to_be/features/notification/domain/usecse/get_notification/get_notification_usecase.dart';
import 'package:be_to_be/features/notification/domain/usecse/post_read_notification_usecase/post_read_notification_usecase.dart';
import 'package:be_to_be/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:be_to_be/features/offers/data/data_source/offer_remote_data_source/offer_remote_data_source.dart';
import 'package:be_to_be/features/offers/data/repositories/offer_repositories/offer_repositories_impl.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:be_to_be/features/offers/domain/usecase/delete_offer_usecase/delete_offer_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_all_offers_usecase/get_all_offers_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_all_tender_usecase/get_all_tender_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/get_cities_offer_usecase/get_cities_offer_usecase.dart';
import 'package:be_to_be/features/offers/domain/usecase/post_accept_offer_usecase/post_accept_offer_usecase.dart';
import 'package:be_to_be/features/offers/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:be_to_be/features/order/data/data_source/orders_remote_data_source/orders_remote_data_source.dart';
import 'package:be_to_be/features/order/data/repositories/orders_repositories_impl.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:be_to_be/features/order/domain/usecase/delete_offer_usecase/delete_offer_order_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/get_mu_offr_usecase/get_my_offer_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/get_orders_usecase/gat_orders_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/post_add_offer_usecase/post_add_offer_usecase.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/premium/presntation/bloc/premium_bloc.dart';
import 'package:be_to_be/features/privacy/data/data_source/privacy_remote_data_source.dart';
import 'package:be_to_be/features/privacy/data/repositories/privacy_repositories.dart';
import 'package:be_to_be/features/privacy/domain/repositories/privacy_repositories.dart';
import 'package:be_to_be/features/privacy/domain/usecase/get_privacy_usecase.dart';
import 'package:be_to_be/features/privacy/presentation/bloc/privacy_bloc.dart';
import 'package:be_to_be/features/profile/data/data_source/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:be_to_be/features/profile/data/repositories/profile_repositories.dart';
import 'package:be_to_be/features/profile/domain/repositories/profile_repositories.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/get_user_dat_usecase.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/post_edit_user_data_usecase.dart';
import 'package:be_to_be/features/profile/domain/usecase/upload_profile_image_usecase/uploade_profile_image_usecase.dart';
import 'package:be_to_be/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:be_to_be/features/terms/data/data_source/terms_remote_data_source.dart';
import 'package:be_to_be/features/terms/data/repositories/terms_repositories.dart';
import 'package:be_to_be/features/terms/domain/repositories/terms_repositories.dart';
import 'package:be_to_be/features/terms/domain/usecase/get_terms_usecase.dart';
import 'package:be_to_be/features/terms/presentation/bloc/terms_bloc.dart';
import 'package:be_to_be/features/upgrade/data/data_source/upgrade_remote_data_source/upgrade_remote_data_source.dart';
import 'package:be_to_be/features/upgrade/data/repositories/update_repositories/upgrade_repositories.dart';
import 'package:be_to_be/features/upgrade/domain/repositories/upgrae_repositories/upgrade_reposirories.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/get_all_package_use_case/get_all_package_use_case.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/post_sub_usecase/post_sub_usecse.dart';
import 'package:be_to_be/features/upgrade/presentation/bloc/upgrade_bloc/upgrade_bloc.dart';
import 'package:be_to_be/features/verification_account/data/data_source/verirfication_remote_data_source.dart';
import 'package:be_to_be/features/verification_account/data/repositories/verification_repositories.dart';
import 'package:be_to_be/features/verification_account/domain/repositories/verification_repositories.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/get_verification_usecase/get_verification_usecase.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/post_verification_code_usecase/post_verification_code_usecase.dart';
import 'package:be_to_be/features/verification_account/presentation/bloc/verification_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl=GetIt.instance;

Future<void>init()async{

  /// Features

        /// Authentication//////////////////////////////////////////////////////////////////////
  // Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(),sharedPreferences: sl()));
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  sl.registerFactory(() => ChooseVerificationBloc(sharedPreferences: sl()));
  sl.registerFactory(() => ForgetPasswordBloc(getForgetPasswordUseCase: sl(),postNewPasswordUseCase: sl()));


  // useCase
  sl.registerLazySingleton(() => LoginUseCase(authRepositories: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepositories: sl()));
  sl.registerLazySingleton(() => GetForgetPasswordUseCase(authRepositories: sl()));
  sl.registerLazySingleton(() => PostNewPasswordUseCase(authRepositories: sl()));

  // repository
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(authDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(client: sl(),sharedPreferences: sl()));


      ///Verification Page//////////////////////////////////////////////////////////////////////

  // Bloc
  sl.registerFactory(() => VerificationBloc(sharedPreferences: sl(),verificationCodeUseCase: sl(),getVerificationCodeUseCase: sl(),registerUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => PostVerificationCodeUseCase(verificationRepositories: sl()));
  sl.registerLazySingleton(() => GetVerificationCodeUseCase(verificationRepositories: sl()));
  // repository
  sl.registerLazySingleton<VerificationRepositories>(() => VerificationRepositoriesImpl(verificationRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<VerificationRemoteDataSource>(() => VerificationRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));


    /// Company Information//////////////////////////////////////////////////////////////////////

  // Bloc
  sl.registerFactory(() => CompanyInformationBloc(getAllCompanyTypeUseCase: sl(),
      uploadImageUseCase: sl(),
    getAllCountryUseCase: sl(),
    getAllCitiesUseCase: sl(),
    addCompanyUseCase: sl(),
    sharedPreferences: sl(),
  ));
  // useCase
  sl.registerLazySingleton(() => GetAllCompanyTypeUseCase(companyInfoRepositories: sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(companyInfoRepositories: sl()));
  sl.registerLazySingleton(() => GetAllCountryUseCase(companyInfoRepositories: sl()));
  sl.registerLazySingleton(() => GetAllCitiesUseCase(companyInfoRepositories: sl()));
  sl.registerLazySingleton(() => AddCompanyUseCase(companyInfoRepositories: sl()));



  // repository
  sl.registerLazySingleton<CompanyInfoRepositories>(() =>CompanyInfoRepositoriesImpl(networkInfo: sl(), companyInfoRemoteDataSource: sl()) );
  // dataSource
  sl.registerLazySingleton<CompanyInfoRemoteDataSource>(() => CompanyInfoRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  /// main//////////////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => MainPageBloc(isLoggedUseCase: sl(),getPackageUsedUseCase: sl(),sharedPreferences: sl(),
  getSettingUseCase: sl(),
  ));
  // useCase
  sl.registerLazySingleton(() => IsLoggedUseCase(mainRepositories: sl()));
  sl.registerLazySingleton(() => GetPackageUsedUseCase(mainRepositories: sl()));
  sl.registerLazySingleton(() => GetSettingUseCase(mainRepositories: sl()));
  // repository
  sl.registerLazySingleton<MainRepositories>(() => MainRepositoriesImpl(mainRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<MainRemoteDataSource>(() => MainRemoteDataSourceImpl(client: sl(),sharedPreferences: sl()));

/// order /////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => OrderBloc(getOrdersUseCase: sl(),postAddOfferUseCase: sl(),
  getMyOfferUseCase: sl(),deleteOfferOrderUseCase: sl()
  ));
  // useCase
  sl.registerLazySingleton(() => GetOrdersUseCase(ordersRepositories: sl()));
  sl.registerLazySingleton(() => PostAddOfferUseCase(ordersRepositories: sl()));
  sl.registerLazySingleton(() => GetMyOfferUseCase(ordersRepositories: sl()));
  sl.registerLazySingleton(() => DeleteOfferOrderUseCase(ordersRepositories: sl(  )));

  // repository
  sl.registerLazySingleton<OrdersRepositories>(() => OrdersRepositoriesImpl(ordersRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<OrdersRemoteDataSource>(() => OrdersRemoteDataSourceImpl(client: sl(),sharedPreferences: sl()));


///profile///////////////////////////////////////////

  //Bloc
  sl.registerFactory(() => ProfileBloc(getUserDataUseCase: sl(),editUserDataUseCase: sl(),sharedPreferences: sl(),uploadProfileImageUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetUserDataUseCase(profileRepositories: sl()));
  sl.registerLazySingleton(() => PostEditUserDataUseCase(profileRepositories: sl()));
  sl.registerLazySingleton(() => UploadProfileImageUseCase(profileRepositories: sl()));
  // repository
  sl.registerLazySingleton<ProfileRepositories>(() => ProfileRepositoriesImpl(profileRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


/// be to be///////////////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => BeToBeBloc(getBeToBeData: sl(),sharedPreferences: sl(),getOffersOnTenderB2BUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetBeToBeData(beToBeRepositories: sl()));
  sl.registerLazySingleton(() => GetOffersOnTenderB2BUseCase(beToBeRepositories: sl()));
  // repository
  sl.registerLazySingleton<BeToBeRepositories>(() => BeToBeRepositoriesImpl(beDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<BeToBeDataSource>(() => BeToBeDataSourceImpl(client: sl(), sharedPreferences: sl()));
/// PREMIUM///////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => PremiumBloc());
  // useCase
  // repository
  // dataSource
/// upgrade//////////////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => UpgradeBloc(allPackageUseCase: sl(),postSubscribeUseCase: sl(),sharedPreferences: sl()));
  // useCase
  sl.registerLazySingleton(() => GetAllPackageUseCase(upgradeRepositories: sl()));
  sl.registerLazySingleton(() => PostSubscribeUseCase(upgradeRepositories: sl()));
  // repository
  sl.registerLazySingleton<UpgradeRepositories>(() => UpgradeRepositoriesImpl(upgradeRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<UpgradeRemoteDataSource>(() => UpgradeRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  /// offers//////////////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => OfferBloc(allTenderUseCase: sl(),getAllOffersUseCase: sl(),deleteOfferUseCase: sl(),
  getCitiesOfferUseCase: sl(),acceptOfferUseCase: sl(),
  ));
  // useCase
  sl.registerLazySingleton(() => GetAllTenderUseCase(offerRepositories: sl()));
  sl.registerLazySingleton(() => GetAllOffersUseCase(offerRepositories: sl()));
  sl.registerLazySingleton(() => DeleteOfferUseCase(offerRepositories: sl()));
  sl.registerLazySingleton(() => GetCitiesOfferUseCase(offerRepositories: sl()));
  sl.registerLazySingleton(() => PostAcceptOfferUseCase(offerRepositories: sl()));
  // repository
  sl.registerLazySingleton<OfferRepositories>(() => OfferRepositoriesImpl(offerRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<OfferRemoteDataSource>(() => OfferRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  /// add tender//////////////////////////////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => AddTenderBloc(getAllProductUseCase: sl(),getCountriesUseCase: sl(),getAllCitiesAddTenderUseCase: sl(),
      addTenderUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetAllProductUseCase(addTenderRepositories: sl()));
  sl.registerLazySingleton(() => GetCountriesAddTenderUseCase(addTenderRepositories: sl()));
  sl.registerLazySingleton(() => GetAllCitiesAddTenderUseCase(addTenderRepositories: sl()));
  sl.registerLazySingleton(() => AddTenderUseCase(addTenderRepositories: sl()));

  // repository
  sl.registerLazySingleton<AddTenderRepositories>(() => AddTenderRepositoriesImpl(addTenderRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<AddTenderRemoteDataSource>(() => AddTenderRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));



  /// choose tender//////////////////////////////////////////////////////////////////////

  //Bloc
  sl.registerFactory(() => ChooseTenderBloc(getCategoriesChooseTenderUseCase: sl(),postCareUseCase: sl(),getBrandsChooseTenderUseCase: sl()
  ,getProductsChooseTenderUseCase: sl(),sharedPreferences: sl(),getMyInterestsUseCase: sl()
  ));


  // useCase
 sl.registerLazySingleton(() => GetCategoriesChooseTenderUseCase(chooseTenderRepositories: sl()));
 sl.registerLazySingleton(() => GetBrandsChooseTenderUseCase(chooseTenderRepositories: sl()));
 sl.registerLazySingleton(() => GetProductsChooseTenderUseCase(chooseTenderRepositories: sl()));
 sl.registerLazySingleton(() => PostCareUseCase(chooseTenderRepositories: sl()));
 sl.registerLazySingleton(() => GetMyInterestsUseCase(chooseTenderRepositories: sl()));

  // repository

  sl.registerLazySingleton<ChooseTenderRepositories>(() => ChooseTenderRepositoriesImpl(chooseTenderRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
sl.registerLazySingleton<ChooseTenderRemoteDataSource>(() => ChooseTenderRemoteDataSourceImpl(client: sl(), sharedPreferences: sl(  )));

/// create tender ////////////////////////////////

  //Bloc
  sl.registerFactory(() => CreateTenderBloc(getCreateTenderCategoriesUseCase: sl(),getCreateTenderBrandsUseCase: sl(),
    addBrandUseCase: sl(),uploadCTImageUseCase: sl(),addProductUseCase: sl(),
  ));

  // useCase
  sl.registerLazySingleton(() => GetCreateTenderCategoriesUseCase(createTenderRepositories: sl()));
  sl.registerLazySingleton(() => GetCreateTenderBrandsUseCase(createTenderRepositories: sl()));
  sl.registerLazySingleton(() => AddBrandUseCase(createTenderRepositories: sl()));
  sl.registerLazySingleton(() => UploadCTImageUseCase(createTenderRepositories: sl()));
  sl.registerLazySingleton(() => AddProductUseCase(createTenderRepositories: sl()));

  // repository
  sl.registerLazySingleton<CreateTenderRepositories>(() => CreateTenderRepositoriesImpl(createTenderRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
sl.registerLazySingleton<CreateTenderRemoteDataSource>(() => CreateTenderRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


/// notification///////////////////////////

  //Bloc
  sl.registerFactory(() => NotificationBloc(getNotificationUseCase: sl(),postReadNotificationUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetNotificationUseCase(notificationRepositories: sl()));
  sl.registerLazySingleton(() => PostReadNotificationUseCase(notificationRepositories: sl()));
  // repository
  sl.registerLazySingleton<NotificationRepositories>(() => NotificationRepositoriesImpl(networkInfo: sl(), notificationRemoteDataSource: sl()));
  // dataSource
sl.registerLazySingleton<NotificationRemoteDataSource>(() => NotificationRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

/// here for history

  //Bloc
  sl.registerFactory(() => HistoryBloc(getTenderHUseCase: sl(),getOrderHUseCase: sl()));

  // useCase
  sl.registerLazySingleton(() => GetTenderHUseCase(historyRepositories: sl()));
  sl.registerLazySingleton(() => GetOrderHUseCase(historyRepositories: sl()));

  // repository
  sl.registerLazySingleton<HistoryRepositories>(() => HistoryRepositoriesImpl(networkInfo: sl(), historyRemoteDataSource: sl()));
  // dataSource
  sl.registerLazySingleton<HistoryRemoteDataSource>(() => HistoryRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


/// launcher

  //Bloc
  sl.registerFactory(() => LauncherBloc(sharedPreferences: sl(),getLauncherCitiesUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetLauncherCitiesUseCase(launcherRepositories: sl()));
  // repository
  sl.registerLazySingleton<LauncherRepositories>(() => LauncherRepositoriesImpl(networkInfo: sl(), launcherRemoteDataSource: sl()));
  // dataSource
  sl.registerLazySingleton<LauncherRemoteDataSource>(() => LauncherRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));


/// about us
  //Bloc
  sl.registerFactory(() => AboutUsBloc(getAboutUsUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetAboutUsUseCase(aboutUsRepositories: sl()));
  // repository
  sl.registerLazySingleton<AboutUsRepositories>(() => AboutUsRepositoriesImpl(aboutUsRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<AboutUsRemoteDataSource>(() => AboutUsRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));

/// here for contact us
  //Bloc
  sl.registerFactory(() => ContactUsBloc(getContactUsUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetContactUsUseCase(contactUsRepositories: sl()));
  // repository
  sl.registerLazySingleton<ContactUsRepositories>(() => ContactUsRepositoriesImpl(contactUsRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<ContactUsRemoteDataSource>(() => ContactUsRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));
/// here for terms

  //Bloc
  sl.registerFactory(() => TermsBloc(getTermsUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetTermsUseCase(termsRepositories: sl()));

  // repository
  sl.registerLazySingleton<TermsRepositories>(() => TermsRepositoriesImpl(termsRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<TermsRemoteDataSource>(() => TermsRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));

/// here for privacy

  //Bloc
  sl.registerFactory(() => PrivacyBloc(getPrivacyUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetPrivacyUseCase(privacyRepositories: sl()));
  // repository
  sl.registerLazySingleton<PrivacyRepositories>(() => PrivacyRepositoriesImpl(privacyRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<PrivacyRemoteDataSource>(() => PrivacyRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));

/// fqa
  //Bloc
  sl.registerFactory(() => FaqBloc(getFQAUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetFQAUseCase(fqaRepositories: sl()));
  // repository
  sl.registerLazySingleton<FQARepositories>(() => FQARepositoriesImpl(faqRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<FAQRemoteDataSource>(() => FAQRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));


/// here for more info B2B
  //Bloc
  sl.registerFactory(() => MoreInfoB2bBloc(getTenderOwnerInfoUseCase: sl(),getOfferOwnerInfoUseCase: sl(),offerExecutedUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetTenderOwnerInfoUseCase(moreInfoB2BRepositories: sl()));
  sl.registerLazySingleton(() => GetOfferOwnerInfoUseCase(moreInfoB2BRepositories: sl()));
  sl.registerLazySingleton(() => PostOfferExecutedUseCase(moreInfoB2BRepositories: sl()));
  // repository
  sl.registerLazySingleton<MoreInfoB2BRepositories>(() => MoreInfoB2BRepositoryImpl(networkInfo: sl(), moreInfoRemoteDataSource: sl()));
  // dataSource
  sl.registerLazySingleton<MoreInfoRemoteDataSource>(() => MoreInfoRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));


  //Bloc
  // useCase
  // repository
  // dataSource




  /// Core//////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External//////////////////////////////////////////////////////////////////////
  final sharedPreferences =await SharedPreferences.getInstance();
  sl.registerLazySingleton(() =>sharedPreferences );
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());






}