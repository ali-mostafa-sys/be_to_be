import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class BackgroundVerificationCompanyWidget extends StatelessWidget {
  const BackgroundVerificationCompanyWidget({Key? key,required this.widgets}) : super(key: key);
 final Widget widgets;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(

        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
          ),
          BoxShadow(
              color:HexColor('#EEEEEE'),
              spreadRadius: -5.0,
              blurRadius: 50.0,
              blurStyle: BlurStyle.normal),
        ],
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: widgets,

    );
  }
}
