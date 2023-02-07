import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/features/add_tender/presentation/bloc/add_tender/add_tender_bloc.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// here for background and terminated notification
Future backgroundMessage (RemoteMessage message)async{

print("${message.notification!.body}");

}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundMessage);

  SharedPreferences sh=di.sl();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  await messaging.getToken().then((value) async{
    print(value);
   await sh.setString('token', value.toString());
  });
/// here for foreground messaging notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('==============================================================');
    print('Message data: ${message.data}');
    print('==============================================================');
    print('Message notification: ${message.notification}');
    print('==============================================================');
    print('Message notification: ${message.notification!.body}');
    print('==============================================================');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
 // await di.init();
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
          ..add(GetAllCountriesEvent())
          ..add(GetAllCompanyTypeEvent())
          ..add(GetCurrentLocationEvent())
          ),

        BlocProvider(create: (_)=>di.sl<MainPageBloc>()..add(IsLoggedEvent())
        ..add(GetUserPackageUsedEvent())..add(GetSettingEvent())
        ),
        //BlocProvider(create: (_)=>di.sl<OrderBloc>()..add(GetAllOrderEvent()) ),


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


