import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class SecondPackageWidget extends StatelessWidget {
   SecondPackageWidget({Key? key,required this.isActive,required this.text}) : super(key: key);
  bool isActive;
  String text;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: w * 0.28,
          height: h * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Package Validity',


                textAlign: TextAlign.center,
                style:
                TextStyle(color: HexColor('#909090'), fontSize: w * 0.04),
              ),
              Text(
                '$text months',
                style:
                TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: w * 0.45,
          height: h * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Active',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#909090'),
                  fontSize: w * 0.04,
                ),
              ),
              Checkbox(
                activeColor: primaryColor,

                value: isActive,
                onChanged: (value) {

                },
              ),

            ],
          ),
        )
      ],
    );
  }
}
