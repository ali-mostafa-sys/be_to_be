

import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/presentation/bloc/upgrade_bloc/upgrade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;


class ShowUpgradeDialogWidget extends StatelessWidget {
  ShowUpgradeDialogWidget({Key? key,required this.subscriptionPackageId}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  bool isPop = true;
  final int subscriptionPackageId;



  final TextEditingController promotionCode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context)=>di.sl<UpgradeBloc>(),
      child: BlocConsumer<UpgradeBloc, UpgradeState>(
        listener: (context, state) {
          print(state);
          if(state is LoadedPostSubscribeState){
            AutoRouter.of(context).pop();
          }

        },
        builder: (context, state) {
          var upgradeBloc = UpgradeBloc.get(context);


          return WillPopScope(
            onWillPop: () async => isPop,
            child: SimpleDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(horizontal: w*0.05),
              title:Text('Do you have Promotion Code ?',style: TextStyle(
                fontSize: w*0.04,
                color: primaryColor
              ),
              ) ,

              // backgroundColor: Colors.red,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h*0.01,
                      ),

                      TextFormFieldWidget(
                          controller: promotionCode,
                          textInputType: TextInputType.text,
                          obscureText: false,
                          labelText: "Promotion Code",
                          validator: (value){}),
                      SizedBox(
                        height: h*0.03,
                      ),
                      state is LoadingPostSubscribeState?const  LoadingWidget():
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Container(
                            width: w*0.3,
                            height: h*0.05,
                            child: ButtonTextWidget(
                                padding: 0,
                                backgroundColor: primaryColor,
                                text: 'No',
                                textColor: Colors.white,
                                textSize: w*0.01,
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    final subscribeEntity=SubscribeEntity(
                                        subscriptionPackageId: subscriptionPackageId,
                                        promotionCode: promotionCode.text.isEmpty==true?null:promotionCode.text);
                                    upgradeBloc.add(PostSubscribeEvent(subscribeEntity: subscribeEntity));
                                  }
                                  print(subscriptionPackageId);
                                }),
                          ),
                          Container(
                            width: w*0.3,
                            height: h*0.05,
                            child: ButtonTextWidget(
                                padding: 0,
                                backgroundColor: primaryColor,
                                text: 'Yes',
                                textColor: Colors.white,
                                textSize: w*0.01,
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    final subscribeEntity=SubscribeEntity(
                                        subscriptionPackageId: subscriptionPackageId,
                                        promotionCode: promotionCode.text.isEmpty==true?null:promotionCode.text);
                                    upgradeBloc.add(PostSubscribeEvent(subscribeEntity: subscribeEntity));
                                  }
                                  print(subscriptionPackageId);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h*0.03,
                      ),



                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}