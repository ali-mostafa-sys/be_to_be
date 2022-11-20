import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class RowExpandedWidget extends StatelessWidget {
   RowExpandedWidget({Key? key,required this.title,required this.data,required this.hasText,required this.hasBuilding}) : super(key: key);
  String title;
  String data;
  bool hasText;
  bool hasBuilding;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(start: w*0.05),
          child: Image.asset('assets/images/square.png',width: w*0.04,),
        ),
        Padding(
          padding:  EdgeInsetsDirectional.only(start: w*0.03),
          child: Text(title,style: TextStyle(
              fontSize: w*0.039,
              color: primaryColor
          ),),
        ),
        Spacer(),
        /// here for data
        Padding(
          padding:  EdgeInsetsDirectional.only(end: w*0.03),
          child: Row(
            children: [
              Text(data,style: TextStyle(
                  fontSize: w*0.039,
                  color: HexColor('#6A6A6A')
              ),
              ),
              SizedBox(
                width: w*0.01,
              ),
              hasText==true?
              Text('Days',style: TextStyle(
                  fontSize: w*0.039,
                  color: HexColor('#6A6A6A')
              ),
              ):Container(),
              hasBuilding==true?
              Image.asset('assets/images/building_row_order.png'):Container(),
            ],
          )
        ),

      ],
    );
  }
}
