
import 'package:flutter/material.dart';

class RowTextPremiumWidget extends StatelessWidget {
   RowTextPremiumWidget({Key? key,required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
            width:w*0.05,
            child: Image.asset('assets/images/dote_1.png')),
        SizedBox(
          width: w*0.03,
        ),
        Text(text,style: TextStyle(
            fontSize: w*0.04
        ),)
      ],
    );
  }
}
