
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';


class ButtonProfiletWidget extends StatelessWidget {
  ButtonProfiletWidget({
    Key? key,
    required this.padding,
    required this.backgroundColor,
    required this.text,

    required this.textSize,
    required this.onPressed,
  }) : super(key: key);
  double padding;
  Color backgroundColor;

  String text;
  double textSize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: padding),
      onPressed: onPressed,
      color: backgroundColor,
      minWidth: double.infinity,
      //
      child: AutoSizeText(
        text,
        style: TextStyle(color: Colors.white, fontSize: textSize),
      ),
    );
  }
}