import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.textSize,
    required this.onTap,
    required this.textDecoration,

  }) : super(key: key);
  String text;
  Color textColor;
  double textSize;
  void Function()? onTap;
  bool textDecoration =true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          decoration:textDecoration==true? TextDecoration.underline:TextDecoration.none,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    );
  }
}
