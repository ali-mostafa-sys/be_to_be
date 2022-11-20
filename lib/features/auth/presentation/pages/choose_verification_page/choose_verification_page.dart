import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/features/auth/presentation/bloc/choose_verification_bloc/choose_verification_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/logo_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/up_login_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;

class ChooseVerificationPage extends StatelessWidget {
  const ChooseVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBody( h: h, w: w),
    );
  }
}

Widget _buildBody(
    { required double h, required double w}) {
  return BlocProvider(
    create: (context) => di.sl<ChooseVerificationBloc>(),
    child: BlocConsumer<ChooseVerificationBloc,ChooseVerificationState>(
      listener: (context, state) {

        if(state is VerificationByPhoneOrEmailState){
          AutoRouter.of(context).pushNamed('/register');
        }
      },
      builder: (context, state) {
      var  bloc=ChooseVerificationBloc.get(context);
        return BackgroundWidget(
            widgets: SingleChildScrollView(
          child: Column(
            children: [
              UpLoginRegisterWidget(text: 'SIGN UP'),
              const LogoWidget(),
              SizedBox(
                height: h * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Choose how to register your account',
                      style: TextStyle(
// 0.05 =21
// 0.01=4.2
                          color: primaryColor,
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            bloc.add(const VerificationByPhoneOrEmailEvent(byPhone: true, byEmail: false));
                          },
                          color: primaryColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: w * 0.33,
                            height: h * 0.33,
                            padding:const EdgeInsets.all(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'By Phone ',
                                  style: TextStyle(
                                      fontSize: w * 0.07, color: Colors.white),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                AutoSizeText(
                                  ' Number',
                                  style: TextStyle(
                                      fontSize: w * 0.07, color: Colors.white),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Image.asset('assets/images/phoneRe.png'),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                             bloc.add(const VerificationByPhoneOrEmailEvent(byPhone: false, byEmail: true));
                          },
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: primaryColor,
                          child: Container(
//  w*0.33= 135
                            width: w * 0.33,
                            height: h * 0.33,
                            padding:const EdgeInsets.all(2),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                AutoSizeText(
                                  'By Email',
                                  style: TextStyle(
                                      fontSize: w * 0.07, color: Colors.white),
                                ),
                                SizedBox(
                                  height: h * 0.04,
                                ),
                                Image.asset('assets/images/emailRe.png'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: w * 0.045,
                          ),
                        ),
                        TextButtonWidget(
                            text: 'Login',
                            textColor: primaryColor,
                            textSize: w * 0.045,
                            textDecoration: true,
                            onTap: () {
                              AutoRouter.of(context).pushNamed('/');
                            })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
      },
    ),
  );
}
