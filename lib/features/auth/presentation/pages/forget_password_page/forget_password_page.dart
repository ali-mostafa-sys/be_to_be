import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/logo_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/up_login_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgetPasswordFirstPage extends StatelessWidget {
   ForgetPasswordFirstPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();

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
            if(state is LoadedGetCodeState){
              AutoRouter.of(context).pushNamed('/forgetPasswordSecond');
              SnackBarMessage().showSnackBar(message: "The operation was completed successfully, you will receive the code on the entered email", backgroundColor: primaryColor, context: context);
            }
            if(state is ErrorGetCodeState){
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
                                'Password recovery',
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
                            state is LoadingGetCodeState?const LoadingWidget():
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: ButtonTextWidget(
                                padding: 10,
                                backgroundColor: primaryColor,
                                text: 'Code request',
                                textColor: Colors.white,
                                textSize: 27,
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    bloc.add(GetCodeEvent(email: email.text.toString()));

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
