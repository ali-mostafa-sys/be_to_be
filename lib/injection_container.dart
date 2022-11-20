
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:be_to_be/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:be_to_be/features/auth/domain/repositories/auth_repositories.dart';
import 'package:be_to_be/features/auth/domain/usecase/login_usecase.dart';
import 'package:be_to_be/features/auth/domain/usecase/register_usecase.dart';
import 'package:be_to_be/features/auth/presentation/bloc/choose_verification_bloc/choose_verification_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/company_information/data/data_source/company_info_remote_data_source/company_info_remote_data_source.dart';
import 'package:be_to_be/features/company_information/data/rpositories/company_info_repositories_impl.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:be_to_be/features/company_information/domain/usecase/add_company_usecase/add_company_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_cities_usecase/get_all_cities_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_company_type_usecase/get_all_company_type_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/get_all_country_usecase/get_al_country_usecase.dart';
import 'package:be_to_be/features/company_information/domain/usecase/uploadImage_usecase/upload_image_usecase.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/home/data/data_source/remote_main_data_source/remote_main_data_source.dart';
import 'package:be_to_be/features/home/data/repositories/main_repositories_impl.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:be_to_be/features/home/domain/usecase/is_logged_usecase/is_logged_usecase.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/order/data/data_source/orders_remote_data_source/orders_remote_data_source.dart';
import 'package:be_to_be/features/order/data/repositories/orders_repositories_impl.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:be_to_be/features/order/domain/usecase/get_orders_usecase/gat_orders_usecase.dart';
import 'package:be_to_be/features/order/domain/usecase/post_add_offer_usecase/post_add_offer_usecase.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/premium/presntation/bloc/premium_bloc.dart';
import 'package:be_to_be/features/profile/data/data_source/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:be_to_be/features/profile/data/repositories/profile_repositories.dart';
import 'package:be_to_be/features/profile/domain/repositories/profile_repositories.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/get_user_dat_usecase.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/post_edit_user_data_usecase.dart';
import 'package:be_to_be/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:be_to_be/features/verification_account/presentation/bloc/verification_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl=GetIt.instance;

Future<void>init()async{

  /// Features

        /// Authentication
  // Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(),));
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  sl.registerFactory(() => ChooseVerificationBloc(sharedPreferences: sl()));


  // useCase
  sl.registerLazySingleton(() => LoginUseCase(authRepositories: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepositories: sl()));
  // repository
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(authDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(client: sl(),sharedPreferences: sl()));


      ///Verification Page

  // Bloc
  sl.registerFactory(() => VerificationBloc(sharedPreferences: sl()));
  // useCase
  // repository
  // dataSource
    /// Company Information

  // Bloc
  sl.registerFactory(() => CompanyInformationBloc(getAllCompanyTypeUseCase: sl(),
      uploadImageUseCase: sl(),
    getAllCountryUseCase: sl(),
    getAllCitiesUseCase: sl(),
    addCompanyUseCase: sl(),
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
  sl.registerLazySingleton<CompanyInfoRemoteDataSource>(() => CompanyInfoRemoteDataSourceImpl(client: sl()));

  /// main
  //Bloc
  sl.registerFactory(() => MainPageBloc(isLoggedUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => IsLoggedUseCase(mainRepositories: sl()));
  // repository
  sl.registerLazySingleton<MainRepositories>(() => MainRepositoriesImpl(mainRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<MainRemoteDataSource>(() => MainRemoteDataSourceImpl(client: sl(),sharedPreferences: sl()));

/// order /////////////////////////////////////////////
  //Bloc
  sl.registerFactory(() => OrderBloc(getOrdersUseCase: sl(),postAddOfferUseCase: sl()));
  // useCase
  sl.registerLazySingleton(() => GetOrdersUseCase(ordersRepositories: sl()));
  sl.registerLazySingleton(() => PostAddOfferUseCase(ordersRepositories: sl()));
  // repository
  sl.registerLazySingleton<OrdersRepositories>(() => OrdersRepositoriesImpl(ordersRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<OrdersRemoteDataSource>(() => OrdersRemoteDataSourceImpl(client: sl(),sharedPreferences: sl()));


///profile///////////////////////////////////////////

  //Bloc
  sl.registerFactory(() => ProfileBloc(getUserDataUseCase: sl(),editUserDataUseCase: sl(),sharedPreferences: sl()));
  // useCase
  sl.registerLazySingleton(() => GetUserDataUseCase(profileRepositories: sl()));
  sl.registerLazySingleton(() => PostEditUserDataUseCase(profileRepositories: sl()));
  // repository
  sl.registerLazySingleton<ProfileRepositories>(() => ProfileRepositoriesImpl(profileRemoteDataSource: sl(), networkInfo: sl()));
  // dataSource
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


/// be to be
  //Bloc
  sl.registerFactory(() => BeToBeBloc());
  // useCase
  // repository
  // dataSource
/// PREMIUM
  //Bloc
  sl.registerFactory(() => PremiumBloc());
  // useCase
  // repository
  // dataSource

  //Bloc
  // useCase
  // repository
  // dataSource


  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  final sharedPreferences =await SharedPreferences.getInstance();
  sl.registerLazySingleton(() =>sharedPreferences );
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());






}