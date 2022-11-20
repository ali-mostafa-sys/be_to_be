import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';


class RadioButtonWidget extends StatelessWidget {
   RadioButtonWidget({Key? key,
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
    return Row(
      children: [
        AutoSizeText(
          textValue,
          style: TextStyle(
            fontSize: 19,
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
