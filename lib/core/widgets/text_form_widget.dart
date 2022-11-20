import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.obscureText,
      required this.labelText,
      this.prefixPath,
        this.padding=10,
       this.hintText,
      this.suffixPath,
        this.suffixIcon,
        this.onTap,
        required this.validator,
      })
      : super(key: key);
  TextEditingController controller;
  TextInputType textInputType;
  bool obscureText = false;
  double padding;
  String labelText;
  String? hintText;
  String? prefixPath;
  String? suffixPath;
  Widget? suffixIcon;
  void Function()? onTap;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(


      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(color: primaryColor, fontSize: 16),
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:const EdgeInsetsDirectional.only(start: 7),

        labelText: labelText,
        hintText:hintText ,
        hintStyle: TextStyle(
          color: primaryColor,
          fontSize: 16,
        ),
        labelStyle: TextStyle(
          color: primaryColor,
          fontSize: 16,
        ),
        prefixIcon:prefixPath!=null? iconPrefixOrSuffix(path: prefixPath.toString(),padding: padding):null,
        suffixIcon:
       suffixIcon==null? suffixPath!=null? iconPrefixOrSuffix(path: suffixPath.toString(),padding: padding):null:suffixIcon,
      ),
      onTap: onTap,
      validator: validator,
    );
  }

  Widget iconPrefixOrSuffix({required String path,double padding =10}) {
    return Padding(
      padding:  EdgeInsets.all(padding),
      child: Container(
        width: 1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(path), scale: 0.2, fit: BoxFit.contain)),
      ),
    );
  }
}


