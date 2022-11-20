import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BackgroundWidget extends StatelessWidget {
   BackgroundWidget({Key? key,required this.widgets}) : super(key: key);
   final Widget widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  BoxDecoration(

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
      ),
      child: widgets,
    );
  }
}
