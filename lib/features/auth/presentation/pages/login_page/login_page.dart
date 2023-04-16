import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/logo_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/up_login_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:be_to_be/injection_container.dart'as di;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
 // final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBody( h: h,w: w),
    );
  }

  Widget _buildBody( {required double h,required double w}) {
    return BlocProvider(
        create: (context)=>di.sl<LoginBloc>()..add(GetTokenEvent()),
      child: BlocConsumer<LoginBloc,LoginState>(
        listener: (context, state) {
          if(state is LoadedLoginState){
            SnackBarMessage().showSnackBar(
                message: 'Login Successfully',
                backgroundColor: Colors.green,
                context: context);
            //AutoRouter.of(context).pushNamed('/main');
            AutoRouter.of(context).pushAndPopUntil(MainPage(), predicate: (route) => false);

          }
          if(state is ErrorLoginState){
            SnackBarMessage().showSnackBar(
                message: state.error,
                backgroundColor: Colors.redAccent,
                context: context);
            if(state.error=='The account is not activated yet'){
              AutoRouter.of(context).pushNamed('/verification');

            }
            if(state.error=='Un Accepted Account'){
              Future.delayed(Duration(seconds: 1)).then((value) {
                AutoRouter.of(context).pushAndPopUntil(RefreshPage(), predicate: (route) => false);
              });

            }
            if(state.error=='Your account is under review. It may take from an hour to a full day'){
              Future.delayed(Duration(seconds: 1)).then((value) {
                AutoRouter.of(context).pushAndPopUntil(RefreshPage(), predicate: (route) => false);
              });
            }
          }

        },
        builder: (context, state) {
          var bloc=LoginBloc.get(context);
          if(state is LoadingLoginState){
            return const LoadingWidget();
          }
          return BackgroundWidget(
            widgets: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UpLoginRegisterWidget(text: 'LOG IN'),
                  const LogoWidget(),
                  SizedBox(
                    height: h * 0.009,
                  ),
                  // 0.03=30
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          bloc.byEmail==false?
                          TextFormFieldWidget(
                            controller:bloc. phoneText,
                            textInputType: TextInputType.text,
                            obscureText: false,
                            labelText: 'Mobile',
                            hintText: '+963946******',
                            prefixPath: 'assets/images/phone.png',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone shouldn\'t not be empty';
                              } else if(value.length<10){
                                return 'The phone number must not be less than 10 digits ';
                              }
                            },
                          )
                              :
                          TextFormFieldWidget(
                            controller:bloc. emailText,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            labelText: 'Email',
                            prefixPath: 'assets/images/email.png',
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value!)) {
                                return 'Pleas insert a correct Email';
                              } else if (value.isEmpty) {
                                return 'Email shouldn\'t not be empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: h * 0.028,
                          ),
                          TextFormFieldWidget(
                            controller: bloc.passwordText,
                            textInputType: TextInputType.text,
                            obscureText: bloc.obSecure,
                            labelText: 'Password',
                            prefixPath: 'assets/images/password.png',
                            suffixIcon: IconButton(
                              onPressed: () {
                                bloc.add(ChangeObSecurePasswordEvent());

                              },
                              icon: bloc.obSecure==false? const Icon(Icons.visibility_off_outlined):const Icon(Icons.remove_red_eye_outlined),
                              iconSize: 30,
                              color: HexColor('#878787'),
                            ),
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Password shouldn\'t not be empty';
                              }else
                              if (value.length < 8) {
                                return 'Password must be more than 8 characters';
                              } else if (value.length > 20) {
                                return 'Password should not be more than 20 characters ';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButtonWidget(
                                  text: 'Forgot password ?',
                                  textColor: primaryColor,
                                  textSize: 19,
                                  textDecoration: false,
                                  onTap: () {
                                    AutoRouter.of(context).pushNamed('/forgetPasswordFirst');

                                  }),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ButtonTextWidget(
                              padding: 10,
                              backgroundColor: primaryColor,
                              text: 'Login',
                              textColor: Colors.white,
                              textSize: 27,
                              onPressed: () {
                               if(formKey.currentState!.validate()){
                                 final loginEntity=LoginEntity(
                                     email:bloc.byEmail==false?bloc.phoneText.text: bloc. emailText.text,
                                     password:bloc. passwordText.text,
                                   notificationToken: bloc.token.toString(),
                                 );
                                 bloc.add(LoginButtonEvent(loginEntity: loginEntity));
                               }



                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AutoSizeText(
                                'Don\'t have an Account?',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w300),
                              ),
                              TextButtonWidget(
                                text: 'SignUp',
                                textColor: primaryColor,
                                textSize: 19,
                                textDecoration: true,
                                onTap: () {
                                  AutoRouter.of(context).pushNamed('/companyInformation');
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },

      ),

    );
  }
}
