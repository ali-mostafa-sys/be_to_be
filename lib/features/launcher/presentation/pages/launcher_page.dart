import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/launcher/presentation/bloc/launcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_widgets/animated_widgets.dart';



class LauncherPage extends StatelessWidget {
   LauncherPage({Key? key}) : super(key: key);
  SharedPreferences sh = di.sl();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body:BlocProvider(
        create: (context)=>di.sl<LauncherBloc>()..add(LauncherPageEvent()),
        child: BlocConsumer<LauncherBloc,LauncherState>(
          listener: (context,state){
            if(state is LauncherPageState){
              /// here when user complete all company inf and go  th refresh page
              bool? companyIsComplete= sh.getBool('companyIsComplete');
              /// here when user complete register inf and go  th verification page
              bool? registerIsComplete= sh.getBool('registerIsComplete');
              /// here when user complete verification and go  th company info page
              bool? verificationIsComplete= sh.getBool('verificationIsComplete');

              Future.delayed(const Duration(seconds: 7)).then((value) {
                if(registerIsComplete==null){
                  AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route)=>false);
                } else  if(registerIsComplete==true){
                  /// here for verification
                  if(verificationIsComplete==null){
                    AutoRouter.of(context).pushAndPopUntil(VerificationPage(), predicate: (route)=>false);

                  }else  if(verificationIsComplete==true){
                    /// here for company ifo
                    if(companyIsComplete==null){
                      AutoRouter.of(context).pushAndPopUntil(CompanyInformationPage(), predicate: (route) => false);
                    }else if(companyIsComplete==true) {
                      AutoRouter.of(context).pushAndPopUntil(const RefreshPage(), predicate: (route) => false);
                    }


                  }

                }

              });



            }
          },
          builder: (context,state){
            return BackgroundWidget(
                widgets: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TranslationAnimatedWidget(
                  enabled: true,
                  values: [
                    Offset(2000, 2000), // disabled value value
                    Offset(250, 250), //intermediate value
                    Offset(0, 0) //enabled value
                  ],
                  duration: Duration(seconds: 6),
                  child: Container(
                    width: w*0.9,
                    height: w*0.9,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      )
                    ),
                  ),
                )

              ],
            )
            );
          },
        ),
      ) ,

    );
  }
}
