import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'injection_container.dart' as di;


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> di.sl<RegisterBloc>()),
        BlocProvider(create: (_)=> di.sl<CompanyInformationBloc>()
          ..add(GetAllCompanyTypeEvent())
          ..add(GetCurrentLocationEvent())
          ..add(GetAllCountriesEvent())),

        BlocProvider(create: (_)=>di.sl<MainPageBloc>()..add(IsLoggedEvent())),
        BlocProvider(create: (_)=>di.sl<OrderBloc>()..add(GetAllOrderEvent()) ),

       // OrderBloc()..add(IntEvent())


      ],
      child: MaterialApp.router(
        builder: (context,widget)=>ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!,),
            minWidth: 200,
            maxWidth: 600

        ),
        debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        theme: appTheme,
      ),
    );

  }
}


