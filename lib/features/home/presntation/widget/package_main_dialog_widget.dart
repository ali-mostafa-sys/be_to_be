
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/first_package_text_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/seconde_package_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


class PackageMainDialogWidget extends StatelessWidget {
  PackageMainDialogWidget({Key? key, }) : super(key: key);
  bool isPop = true;

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
            title: Text('Package Usage',style: TextStyle(
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
                  Container(
                    width: w*0.21,
                    child: Center(
                      child: Text('${mainBloc.packageName } Package',
                        style: TextStyle(
                          fontSize: w*0.05,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,


                      ),),
                    ),
                  ),



                ],
              ),
              SizedBox(
                height: h*0.05,
              ),
              FirstPackageTextWidget(remainTender: "${mainBloc.remainingTender}", numberOfTender: "${mainBloc.dayTender}"),
              SizedBox(
                height: h*0.03,
              ),
              SecondPackageWidget(isActive: mainBloc.isActive==1?true:false, text: '${mainBloc.packageValidate}'),


            ],
          ),
        );
      },
    );
  }
}