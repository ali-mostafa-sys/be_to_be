
import 'package:flutter/material.dart';

class MoreInfoContainerWidget extends StatelessWidget {
  MoreInfoContainerWidget({Key? key,required this.widget}) : super(key: key);
  Widget widget;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child:widget ,

      ),
    );
  }
}