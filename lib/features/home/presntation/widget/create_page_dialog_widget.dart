
import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCreatePageDialogWidget extends StatelessWidget {
  ShowCreatePageDialogWidget({Key? key,}) : super(key: key);
  bool isPop = false;




  final TextEditingController promotionCode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
        print(state);

      },
      builder: (context, state) {
        var mainBloc = MainPageBloc.get(context);


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
                  Text('Are you sure you want to leave this page?',style: TextStyle(
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
                              AutoRouter.of(context).pop();
                              // isPop=true;
                              // AutoRouter.of(context).pushAndPopUntil(MainPage(), predicate: (route) => false);


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
                              mainBloc.add(AcceptLeaveCreatePageEvent());
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
    );
  }
}