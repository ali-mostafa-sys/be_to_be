import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/core/widgets/up_page_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_verification_company_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/verification_account/presentation/bloc/verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:be_to_be/injection_container.dart' as di;

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  final TextEditingController verificationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => di.sl<VerificationBloc>()..add(GetOTPCodeEvent()),
        child: BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state) {
            print(state);

            if (state is LoadedGetOTPCodeState) {
              SnackBarMessage().showSnackBar(
                  message: 'The message will reach you ',
                  backgroundColor: primaryColor,
                  context: context);
            }
            if(state is ErrorGetOTPCodeState){
              SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
            }
            /// here for send code
            if(state is ErrorSendOTPCodeState){
              SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
            }
            if(state is LoadedSendOTPCodeState){
              SnackBarMessage().showSnackBar(message: 'Success ', backgroundColor: Colors.redAccent, context: context);
              AutoRouter.of(context).pushAndPopUntil(CompanyInformationPage(), predicate: (route) => false);
            }



            /// here for otp message
            /// AutoRouter.of(context).pushAndPopUntil(VerificationPage(), predicate: (route) => false);
            // if (state is OnOpenVerificationPageState) {}
          },
          builder: (context, state) {
            var bloc = VerificationBloc.get(context);
            return Padding(
              padding: EdgeInsets.only(top: h * 0.036),
              child: BackgroundWidget(
                  widgets: Stack(
                    children: [
                      UpPageWidget(
                        title: "Verification Code ",
                        text: bloc.byPhone == true
                            ? "Please enter the 4 digits code that we have sent to your mobile number ."
                            : 'Please enter the 4 digits code that we have sent to your email .',
                        textPadding: w * 0.008,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.26),
                        child: BackgroundVerificationCompanyWidget(
                          widgets: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                Image.asset(
                                  'assets/images/verification.png',
                                  width: w * 0.4,
                                ),
                                SizedBox(
                                  height: h * 0.04,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        PinCodeTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please fill the field with code';
                                            } else if (value.length < 4) {
                                              return 'Please fill all the fields';
                                            } else {
                                              return null;
                                            }
                                          },
                                          length: 4,
                                          hintCharacter: '*',
                                          backgroundColor:
                                          HexColor('#E6E6E6').withOpacity(0.0),
                                          obscureText: false,
                                          animationType: AnimationType.fade,
                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.box,
                                            borderRadius: BorderRadius.circular(7),
                                            fieldHeight: 50,
                                            fieldWidth: 40,
                                            activeFillColor: Colors.white,
                                            activeColor: primaryColor,
                                            errorBorderColor:
                                            Colors.white.withOpacity(0.0),
                                            inactiveColor: primaryColor,
                                            disabledColor: primaryColor,
                                            selectedColor: primaryColor,
                                            selectedFillColor: primaryColor,
                                            inactiveFillColor: HexColor('#E6E6E6'),
                                          ),
                                          animationDuration:
                                          const Duration(milliseconds: 300),
                                          controller: verificationController,
                                          onCompleted: (value) {
                                          },
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          appContext: context,
                                        ),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        state is LoadingSendOTPCodeState?const LoadingWidget():
                                        ButtonTextWidget(
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              bloc.add(SendOTPMessageEvent(loginName:bloc.loginName.toString(),
                                                  code: verificationController.text.toString()));
                                              print('okk');
                                              print(verificationController.text);
                                              // print(verificationController.text);
                                              //AutoRouter.of(context).pushNamed('/companyInformation');
                                            }
                                          },
                                          text: 'Accept',
                                          padding: 4,
                                          backgroundColor: primaryColor,
                                          textSize: w * 0.08,
                                          textColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'Didn\'t receive the code ?',
                                              style: TextStyle(
                                                  fontSize: w * 0.04,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            TextButtonWidget(
                                              text: 'Click here',
                                              textColor: primaryColor,
                                              textSize: w * 0.04,
                                              textDecoration: true,
                                              onTap: () {
                                                bloc.add(GetOTPCodeEvent());
                                                // AutoRouter.of(context).pushNamed('/');
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
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }

  // Widget _buildBody(
  //     {required BuildContext context, required double h, required double w}) {
  //   return ;
  // }
}
