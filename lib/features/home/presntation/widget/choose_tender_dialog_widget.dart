
import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseTenderDialogWidget extends StatelessWidget {
  ChooseTenderDialogWidget({Key? key, }) : super(key: key);
  bool isPop = false;

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
            // backgroundColor: Colors.red,
            title: Text('Choose Tender',style: TextStyle(
                fontSize: w*0.05,
                color: primaryColor,
                fontWeight: FontWeight.bold
            ),),
            titlePadding: EdgeInsets.symmetric(vertical: h*0.015,horizontal: w*0.05),

            children: [
              const  Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h*0.01,
                  ),
                 Text('Please choose your tenders!!',style: TextStyle(
                   color: primaryColor,
                   fontSize: w*0.05
                 ),),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: w*0.2),
                    child: ButtonTextWidget(
                        padding: 0,
                        backgroundColor: primaryColor,
                        text: 'Ok',
                        textColor: Colors.white,
                        textSize: w*0.05,
                        onPressed: (){
                          AutoRouter.of(context).pushNamed('/chooseTender');
                        }),
                  )



                ],
              ),


            ],
          ),
        );
      },
    );
  }
}