import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';

class CompanyInfoWidget extends StatelessWidget {
  CompanyInfoWidget({Key? key, required this.path, required this.text})
      : super(key: key);
  String path;
  String text;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.05,
      child: Row(
        children: [
          Image.asset(
            path,
            scale: 0.1,
          ),
          SizedBox(
            width: w * 0.01,
          ),
          Text(
            text,
            style: TextStyle(color: primaryColor),
          )
        ],
      ),
    );
  }
}

class CompanyInfoReWidget extends StatelessWidget {
  CompanyInfoReWidget({Key? key, required this.path, required this.text})
      : super(key: key);
  String path;
  String text;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.05,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(color: primaryColor),
          ),
          SizedBox(
            width: w * 0.01,
          ),
          Image.asset(
            path,
            scale: 0.1,
          ),


        ],
      ),
    );
  }
}
