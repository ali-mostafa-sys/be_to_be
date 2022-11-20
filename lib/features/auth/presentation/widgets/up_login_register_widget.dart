import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class UpLoginRegisterWidget extends StatelessWidget {
  String text;

  UpLoginRegisterWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w =MediaQuery.of(context).size.width;
    final h =MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(top: h*0.036),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
        const  Image(
            image: AssetImage('assets/images/up.png'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(
              top: h*0.07,end: 150,

            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: AutoSizeText(
                text,
                style:  TextStyle(color: Colors.white, fontSize: w*0.13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}