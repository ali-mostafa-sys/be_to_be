import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';



class ForgetPasswordSecondPage extends StatelessWidget {
   ForgetPasswordSecondPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context)=>di.sl<ForgetPasswordBloc>(),
        child: BlocConsumer<ForgetPasswordBloc,ForgetPasswordState>(
          listener: (context,state){
            print(state);
            if(state is LoadedPostNewPasswordState){
              AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route)=>false);
              SnackBarMessage().showSnackBar(message: "The password has been changed successfully, now you can Login", backgroundColor: primaryColor, context: context);
            }
            if(state is ErrorPostNewPasswordState){
              SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
            }
          },
          builder: (context,state){
            var bloc=ForgetPasswordBloc.get(context);
            return BackgroundWidget(
              widgets: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: h*0.036),
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          const  Image(
                            image: AssetImage('assets/images/up.png'),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding:  EdgeInsetsDirectional.only(
                              top: h*0.07,end: 150,

                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: AutoSizeText(
                                'Change Password ',
                                style:  TextStyle(color: Colors.white, fontSize: w*0.08),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            TextFormFieldWidget(
                              controller:email,
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
                              controller:password,
                              textInputType: TextInputType.text,
                              obscureText: false,
                              labelText: 'Password',
                              prefixPath: 'assets/images/password.png',
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
                            SizedBox(
                              height: h * 0.028,
                            ),
                            TextFormFieldWidget(
                              controller:code,
                              textInputType: TextInputType.text,
                              obscureText: false,
                              labelText: 'Code',
                              suffixIcon: Icon(Icons.code,color: primaryColor,),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Code shouldn\'t not be empty';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: h * 0.028,
                            ),
                            state is LoadingPostNewPasswordState?const LoadingWidget():
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: ButtonTextWidget(
                                padding: 10,
                                backgroundColor: primaryColor,
                                text: 'Change Password',
                                textColor: Colors.white,
                                textSize: 27,
                                onPressed: () {
                                  if(formKey.currentState!.validate()){

                                    bloc.add(PostNewPasswordEvent(email: email.text.toString(),password: password.text.toString(),code: code.text.toString()));

                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const AutoSizeText(
                            //       'Don\'t have an Account?',
                            //       style: TextStyle(
                            //           fontSize: 19, fontWeight: FontWeight.w300),
                            //     ),
                            //     TextButtonWidget(
                            //       text: 'SignUp',
                            //       textColor: primaryColor,
                            //       textSize: 19,
                            //       textDecoration: true,
                            //       onTap: () {
                            //         AutoRouter.of(context).pushNamed('/companyInformation');
                            //       },
                            //     )
                            //   ],
                            // )
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
      ),
    );
  }
}









