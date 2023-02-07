import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:flutter/material.dart';


class RowButtonWidget extends StatelessWidget {
   RowButtonWidget({Key? key,required this.isOrder,required this.tenderTap,required this.orderTap}) : super(key: key);


  String isOrder;
   Function()? tenderTap;
   Function()? orderTap;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h*0.1,
      width: w,
      child: Row(
        children: [
          SizedBox(
            width: w*0.03,
          ),

          Expanded(

            child: ButtonTextWidget(
              padding: 0,
              backgroundColor: isOrder=='tender'? primaryColor:primaryColor.withOpacity(0.3),
              text: 'Tenders',
              textSize: isOrder=='tender'? w*0.1: w*0.07,
              textColor: Colors.white,
              onPressed: tenderTap,
            ),
          ),
          SizedBox(
            width: w*0.03,
          ),
          Expanded(

            child: ButtonTextWidget(
              padding: 0,
              backgroundColor:isOrder=='order'? primaryColor:primaryColor.withOpacity(0.3),
              text: 'Offers',
              textSize:isOrder=='order'? w*0.1: w*0.07,
              textColor: Colors.white,
              onPressed: orderTap,
            ),
          ),
          SizedBox(
            width: w*0.03,
          ),
        ],
      ),
    );
  }
}
