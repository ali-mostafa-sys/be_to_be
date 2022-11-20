import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';


class SwitchButtonWidget extends StatelessWidget {
   SwitchButtonWidget({Key? key,required this.isSwitched,required this.text,required this.onChange}) : super(key: key);

  bool isSwitched;
  String text;
   void Function(bool)? onChange;

   @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsetsDirectional.only(start:  w*0.01,end: w*0.07),
      child: Row(
        children: [
          Text(text,style: TextStyle(
              color: primaryColor,
              fontSize: w*0.05
          ),),
          Spacer(),
          Switch(
            onChanged:onChange,

            //     (value){
            //   // bloc.add(IncludeDeliverySwitchButtonEvent(isInclude: value));
            //   // print(isSwitched);
            //
            // },
            value: isSwitched,
            activeColor: primaryColor,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
