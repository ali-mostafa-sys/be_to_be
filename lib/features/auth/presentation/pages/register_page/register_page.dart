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
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/logo_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/radio_button_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/show_phone_dialog_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/up_login_register_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  SharedPreferences sh=di.sl();


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBody(h: h, w: w),
    );
  }

  Widget _buildBody({required double h, required double w}) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        print(state);
        /// here for register state
        if(state is LoadedRegisterState){
          SnackBarMessage().showSnackBar(message: 'Registered Successfully', backgroundColor: primaryColor, context: context);
          AutoRouter.of(context).pushNamed('/verification');
           //AutoRouter.of(context).pushAndPopUntil(VerificationPage(), predicate: (route) => false);
        }
        if(state is ErrorRegisterState){
          SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
        }
        /// here on press next button on popUp state
        if (state is OnPhoneNextButtonState) {
          RegisterBloc.get(context).phone.text = state.phoneValue;
        }
        /// here for show dialog state
        if (state is ShowPhoneDialogState) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return PhoneDialogWidget();
              });
        }
      },
      builder: (context, state) {
        var bloc = RegisterBloc.get(context);
        if(state is LoadingRegisterState){
          return const  LoadingWidget();
        }

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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      /// here for last and first name
                      TextFormFieldWidget(
                        controller: bloc.firstName,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        labelText: 'First Name',
                        prefixPath: 'assets/images/user.png',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'First Name shouldn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      TextFormFieldWidget(
                        controller: bloc. lastName,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        labelText: 'Last Name',
                        prefixPath: 'assets/images/user.png',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Last Name shouldn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      /// here for email
                      TextFormFieldWidget(
                        controller: bloc. email,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        labelText: 'Email',
                        prefixPath: 'assets/images/email.png',
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value!)) {
                            return 'Pleas insert a correct Email';
                          } else if (value.isEmpty) {
                            return 'Email shouldn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),

                      /// here for phone
//TODO: PHONE
                      TextFormFieldWidget(
                        controller: bloc.phone,
                        textInputType: TextInputType.none,
                        obscureText: false,
                        labelText: 'Phone',
                        prefixPath: 'assets/images/phone.png',
                        onTap: () {
                          bloc.add(OnPhoneFieldTapEvent());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone shouldn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      /// here fpr password and confirm it
                      TextFormFieldWidget(
                        controller: bloc. password,
                        textInputType: TextInputType.text,
                        obscureText: bloc.obSecure1,
                        labelText: 'Password',
                        prefixPath: 'assets/images/password.png',
                        suffixIcon: IconButton(
                          onPressed: () {
                            bloc.add(ChangeObSecurePasswordEvent());
                          },
                          icon: bloc.obSecure1==false? const Icon(Icons.visibility_off_outlined):const Icon(Icons.remove_red_eye_outlined),
                          iconSize: 30,
                          color: HexColor('#878787'),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password must be more than 8 characters';
                          } else if (value.length > 20) {
                            return 'Password shouldn\'t be more than 20 characters ';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      TextFormFieldWidget(
                        controller: bloc. rePassword,
                        textInputType: TextInputType.text,
                        obscureText: bloc.obSecure1,
                        labelText: 'Confirm Password',
                        prefixPath: 'assets/images/password.png',
                        suffixIcon: IconButton(
                          onPressed: () {
                           bloc.add(ChangeObSecurePasswordEvent());
                          },
                          icon: bloc.obSecure1==false? const Icon(Icons.visibility_off_outlined):const Icon(Icons.remove_red_eye_outlined),
                          iconSize: 30,
                          color: HexColor('#878787'),
                        ),
                        validator: (value) {
                          if (value != bloc. password.text) {
                            return 'Password is not much';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      TextFormFieldWidget(
                        controller: bloc. birthDate,
                        textInputType: TextInputType.none,
                        obscureText: false,
                        labelText: 'Birth Date',
                        hintText: 'YYYY-MM-DD',
                        prefixPath: 'assets/images/calendar.png',
                        onTap: (){
                          showDatePicker(
                              context: context,
                              initialDate:DateTime.parse("1990-03-08T19:00:00Z"),
                              firstDate: DateTime.parse("1900-01-01T19:00:00Z"),
                              lastDate: DateTime.now())
                              .then((value) {
                                bloc.date=value.toString();

                                bloc. birthDate.text=DateFormat.yMd().format(value!,);
                          });
                        },
                        validator: (value) {
                        if (value!.isEmpty) {
                            return 'Birth Date shouldn\'t be empty';
                          } else {
                            return null;
                          }

                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      /// here for gender
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            'Gender :',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                          RadioButtonWidget(
                              groupValue: bloc.gender,
                              textValue: "Male",
                              value: "Male",
                              onChanged: (value) {
                                bloc.add(ChooseGenderEvent(gender: value));
                              }),
                          RadioButtonWidget(
                              groupValue: bloc.gender,
                              textValue: "Female",
                              value: "Female",
                              onChanged: (value) {
                                bloc.add(ChooseGenderEvent(gender: value));
                              }),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.06,
                      ),
                      /// here for register
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ButtonTextWidget(
                          padding: 10,
                          backgroundColor: primaryColor,
                          text: 'SignUp',
                          textColor: Colors.white,
                          textSize: 27,
                          onPressed: ()async {
                         //  AutoRouter.of(context).pushNamed('/verification');
                            if(formKey.currentState!.validate()){
                              await sh.setString('email', bloc.email.text.toString());
                              await sh.setString('phone', bloc.phone.text.toString());
                              await sh.setString('password', bloc.password.text.toString());
                              AutoRouter.of(context).pushNamed('/verification');

                              // String? companyId=sh.getString('companyId');
                              // final registerEntity=RegisterEntity(
                              //     firstName:bloc. firstName.text.toString(),
                              //     lastName:bloc. lastName.text.toString(),
                              //     email: bloc.email.text.toString(),
                              //     mobileNumber: bloc.phone.text.toString(),
                              //     password:bloc. password.text.toString(),
                              //     birthDate: bloc.date,
                              //     companyId:companyId! ,
                              //     gender: bloc.gender.toString(),
                              //     hasMobileWhatsApp: bloc.hasPhone);
                              // print(registerEntity);



                             // bloc.add(RegisterButtonEvent(registerEntity: registerEntity));

                            }
                          // print(bloc.hasPhone);




                          },
                        ),
                      ),
                      SizedBox(
                        height: h * 0.008,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AutoSizeText(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w300),
                          ),
                          TextButtonWidget(
                            text: 'Login',
                            textColor: primaryColor,
                            textSize: 19,
                            textDecoration: true,
                            onTap: () {
                              AutoRouter.of(context).pushNamed('/login');
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
        ));

        /////////////////////////////////
      },
    );
  }
}
