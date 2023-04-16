



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
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_verification_company_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/verification_account/presentation/bloc/verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPhonePage extends StatelessWidget {
  VerificationPhonePage({Key? key}) : super(key: key);
  final TextEditingController verificationController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SharedPreferences sh=di.sl();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => di.sl<VerificationBloc>()..add(GetOTPCodeEvent(byEmail: false)),
        child: BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state) {
            print(state);

            if (state is LoadedGetOTPCodeState) {
              SnackBarMessage().showSnackBar(
                  message: 'The message will come to your phone ',
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
              SnackBarMessage().showSnackBar(message: 'Phone verification succeeded ', backgroundColor: primaryColor, context: context);
              AutoRouter.of(context).pushAndPopUntil(const RefreshPage(), predicate: (route) => false);
            }
            /// here for error register message

            if(state is ErrorRegisterVState){
              SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
              AutoRouter.of(context).pushAndPopUntil( RegisterPage(), predicate: (route) => false);
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
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: w*0.1),
                                  child: Text(
                                    'Please note that phone '
                                        'verification is required for signup.'
                                        ' Your number will only be used to verify your identity for security purposes',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
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
                                        BlocConsumer<RegisterBloc, RegisterState>(
                                          listener: (context,state){

                                          },
                                          builder: (context,state){
                                            var reBloc=RegisterBloc.get(context);
                                            return ButtonTextWidget(
                                              onPressed: () {
                                                if (formKey.currentState!.validate()) {
                                                  String? companyId=sh.getString('companyId');
                                                  final registerEntity=RegisterEntity(
                                                      firstName:reBloc. firstName.text.toString(),
                                                      lastName:reBloc. lastName.text.toString(),
                                                      email: reBloc.email.text.toString(),
                                                      mobileNumber: reBloc.phone.text.toString(),
                                                      password:reBloc. password.text.toString(),
                                                      birthDate: reBloc.date,
                                                      companyId:companyId! ,
                                                      gender: reBloc.gender.toString(),
                                                      hasMobileWhatsApp: reBloc.hasPhone);

                                                  bloc.add(SendOTPMessageEvent(loginName:bloc.loginName.toString(),
                                                      code: verificationController.text.toString(),registerEntity: registerEntity));

                                                  print(registerEntity);
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
                                            );
                                          },

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
                                                bloc.add(GetOTPCodeEvent(byEmail: false));
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


