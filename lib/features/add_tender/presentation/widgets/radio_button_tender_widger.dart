import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';


class RadioButtonTenderWidget extends StatelessWidget {
  RadioButtonTenderWidget({Key? key,
    required this.groupValue,
    required this.textValue,
    required this.value,

    required this.onChanged

  }) : super(key: key);

  dynamic groupValue;
  dynamic value;
  String textValue;
  var onChanged;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        AutoSizeText(
          textValue,
          style: TextStyle(
            fontSize: w*0.02,
          ),
        ),
        Radio<dynamic>(
          value: value,
          groupValue: groupValue,
          activeColor: primaryColor,
          onChanged: onChanged,
        ),

      ],
    );
  }
}