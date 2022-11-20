import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';


class RowTextWidget extends StatelessWidget {
   RowTextWidget({Key? key,
   required this.controller,
     required this.textInputType,
     required this.text,
     required this.validate,
      this.imagePath,
     this.onTap,

   }) : super(key: key);
  TextEditingController controller;
   TextInputType textInputType;
   String? imagePath;
   String text;
   String? Function(String?)? validate;
   void Function()? onTap;

   @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
      child: Row(
        children: [
          Container(
            width: w * 0.34,
            child: Text(
              text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontSize: w * 0.05,
              ),
            ),
          ),
          Spacer(),
          Container(
            width: w * 0.3,
            height: h * 0.045,
            child: TextFormFieldWidget(
                controller: controller,
                textInputType: textInputType,
                obscureText: false,
                labelText: '',
                suffixPath: imagePath,
                padding: 5,
                onTap:onTap ,

                validator: validate,
                ),
          ),
        ],
      ),
    );
  }
}
