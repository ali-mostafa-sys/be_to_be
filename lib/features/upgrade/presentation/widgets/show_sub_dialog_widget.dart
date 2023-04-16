
import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/upgrade/presentation/bloc/upgrade_bloc/upgrade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;


class ShowSubDialogWidget extends StatelessWidget {
  ShowSubDialogWidget({Key? key,required this.packagerName}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  bool isPop = false;
  String packagerName;



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
          // if(state is LoadedPaymentState){
          //   mBloc.add(const ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  4));
          //   SnackBarMessage().showSnackBar(message: 'Congratulations, the payment process has been completed successfully. Now you can add tenders and benefit from many offers', backgroundColor: primaryColor, context: context);
          //   mBloc.add(GetUserPackageUsedEvent());
          //
          //   Future.delayed(Duration(seconds: 1,microseconds: 500)).then((value) {
          //     AutoRouter.of(context).pop();
          //     AutoRouter.of(context).pushAndPopUntil(MainPage(), predicate: (route) => false);
          //     mBloc.add(const ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  4));
          //   });
          // }
          // if(state is ErrorPaymentState){
          //   SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
          //   AutoRouter.of(context).pop();
          // }

        },
        builder: (context, state) {
          var upgradeBloc = UpgradeBloc.get(context);


          return WillPopScope(
            onWillPop: () async => isPop,
            child: SimpleDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(horizontal: w*0.05),

              // backgroundColor: Colors.red,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h*0.01,
                    ),
                    Text('You are already subscribed to the $packagerName package, do you want to continue?',style: TextStyle(
                        fontSize: w*0.04,
                        color: primaryColor
                    ),
                    ) ,
                    SizedBox(
                      height: h*0.01,
                    ),



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
                                isPop=true;
                                AutoRouter.of(context).pushAndPopUntil(MainPage(), predicate: (route) => false);


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
                                isPop=true;
                                AutoRouter.of(context).pop();

                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h*0.03,
                    ),



                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}