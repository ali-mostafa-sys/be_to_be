import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';


class ErrorPageWidget extends StatelessWidget {
   ErrorPageWidget({Key? key,required this.errorText,required this.onTap}) : super(key: key);
   String errorText;
   var onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorText),
          const SizedBox(
            height: 30,
          ),
          InkWell(

            onTap: onTap,
            child: Container(
              padding:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),



              child:const Text(
                'Refresh',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
