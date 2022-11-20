import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/core/widgets/text_widget.dart';
import 'package:be_to_be/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneDialogWidget extends StatelessWidget {
   bool isPop = false;

   PhoneDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterBloc,RegisterState>(
      listener: (context,state){
        print(state);
        if(state is OnPhoneNextButtonState){
          isPop = true;
          AutoRouter.of(context).pop();
        }
      },
      builder: (context,state){
        var bloc =RegisterBloc.get(context);
        return  WillPopScope(
          onWillPop: () async => isPop,
          child: SimpleDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Center(
                child: AutoSizeText(
                  'Enter your phone number',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                )),
            backgroundColor: Colors.white,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: bloc.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormFieldWidget(
                            controller: bloc.phone,
                            textInputType: TextInputType.phone,
                            obscureText: false,
                            labelText: 'Phone',
                            prefixPath: 'assets/images/phone.png',
                            validator: (value){
                              if (value!.isEmpty) {
                                return 'Field should not be empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: h*0.04,
                        ),
                        TextWidget(text: 'Do you have WhatsApp'),
                        TextWidget(text: 'for this number ?'),
                        SizedBox(
                          height: h*0.04,
                        ),
                        Image.asset('assets/images/whatsapp.png'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RadioButtonWidget(
                                groupValue: bloc.hasPhone,
                                textValue: 'Yes',
                                value: true,
                                onChanged: (value){
                                  bloc.add(ChooseHasPhoneEvent(hasPhone: value));
                                }
                                ),
                            RadioButtonWidget(
                                groupValue:  bloc.hasPhone,
                                textValue: 'No',
                                value: false,
                                onChanged: (value){
                                  bloc.add(ChooseHasPhoneEvent(hasPhone: value));
                                }
                                ),
                          ],
                        ),
                        SizedBox(
                          height: h*0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:w*0.25,
                              child: ButtonTextWidget(
                                  padding: 0,
                                  backgroundColor: Colors.white,
                                  text: 'Back',
                                  textColor: primaryColor,
                                  textSize: 14,
                                  onPressed: (){
                                    isPop = true;
                                    AutoRouter.of(context).pop();
                                  }),
                            ),
                            Container(
                              width:w*0.25,
                              child: ButtonTextWidget(
                                  padding: 0,
                                  backgroundColor: primaryColor,
                                  text: 'Next',
                                  textColor: Colors.white,
                                  textSize: 14,
                                  onPressed: (){
                                    if(bloc.formKey.currentState!.validate()){

                                      bloc.add(OnPhoneNextButtonEvent(phoneNumber: bloc.phone.text.toString()));
                                    }

                                  }),
                            ),
                          ],
                        )
                      ],
                    ),),
              )

            ],
          ),
        );
      },
    );
  }
}
