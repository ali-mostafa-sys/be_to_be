import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
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
import 'package:be_to_be/injection_container.dart'as di;

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  final TextEditingController verificationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _buildBody(context: context, h: h, w: w),
    );
  }

  Widget _buildBody(
      {required BuildContext context, required double h, required double w}) {
    return BlocProvider(
        create: (context)=>di.sl<VerificationBloc>()..add(OnOpenVerificationPageEvent()),
      child: BlocConsumer<VerificationBloc,VerificationState>(
        listener: (context,state){
          // if(state is OnOpenVerificationPageState){
          //
          // }

        },
        builder: (context,state){
          var bloc=VerificationBloc.get(context);
          if(state is OnOpeningVerificationPageState ){
            return const LoadingWidget();
          }
          return
            Padding(
              padding: EdgeInsets.only(top: h * 0.036),
              child: BackgroundWidget(
                  widgets: Stack(
                    children: [
                      UpPageWidget(
                          title: "Verification Code ",
                          text:bloc.byPhone==true?
                          "Please enter the 4 digits code that we have sent to your mobile number ."
                              :'Please enter the 4 digits code that we have sent to your email .',
                        textPadding: w*0.008,



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
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'Please fill the field with code';
                                            }else if(value.length<4){
                                              return 'Please fill all the fields';
                                            }else{
                                              return null;
                                            }
                                          },

                                          length: 4,
                                          hintCharacter: '*',
                                          backgroundColor: HexColor('#E6E6E6').withOpacity(0.0),
                                          obscureText: false,
                                          animationType: AnimationType.fade,


                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.box,
                                            borderRadius: BorderRadius.circular(7),

                                            fieldHeight: 50,
                                            fieldWidth: 40,
                                            activeFillColor: Colors.white,
                                            activeColor: primaryColor,
                                            errorBorderColor: Colors.white.withOpacity(0.0),
                                            inactiveColor: primaryColor,
                                            disabledColor: primaryColor,
                                            selectedColor: primaryColor,
                                            selectedFillColor: primaryColor,
                                            inactiveFillColor: HexColor('#E6E6E6'),
                                          ),
                                          animationDuration: const Duration(milliseconds: 300),
                                          controller: verificationController,
                                          onCompleted: (value) {

                                          },

                                          onChanged: (value) {
                                            print(value);
                                          },
                                          appContext: context,
                                        ),
                                        SizedBox(
                                          height: h*0.05,
                                        ),
                                        ButtonTextWidget(
                                          onPressed: (){
                                            if(formKey.currentState!.validate()){
                                              print('okk');
                                              AutoRouter.of(context).pushNamed('/companyInformation');
                                            }
                                          },
                                          text: 'Accept',
                                          padding: 4,
                                          backgroundColor: primaryColor,
                                          textSize: w*0.08,
                                          textColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: h*0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'Didn\'t receive the code ?',
                                              style: TextStyle(
                                                  fontSize: w*0.04, fontWeight: FontWeight.w300),
                                            ),
                                            TextButtonWidget(
                                              text: 'Click here',
                                              textColor: primaryColor,
                                              textSize: w*0.04,
                                              textDecoration: true,

                                              onTap: () {
                                                AutoRouter.of(context).pushNamed('/');
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

    );
  }
}


