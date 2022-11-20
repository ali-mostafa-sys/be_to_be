import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UpPageWidget extends StatelessWidget {
  String title;
  String text;
  double textPadding;

  UpPageWidget({Key? key, required this.title,required this.text,required this.textPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      height: h,
      width: w,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image(
            image: AssetImage('assets/images/up.png'),
            width: double.infinity,
            // height: h*0.35,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: h * 0.01,
              end: w * 0.3,
            ),
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    AutoSizeText(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: w * 0.08),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(textPadding),
                      child: AutoSizeText(
                        text,
                        style: TextStyle(color: Colors.white, fontSize: w * 0.05),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
