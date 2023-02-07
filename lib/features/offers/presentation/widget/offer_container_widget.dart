import 'package:flutter/material.dart';


class OfferContainerWidget extends StatelessWidget {
  OfferContainerWidget({Key? key,required this.widget}) : super(key: key);
  Widget widget;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: w,
        height: h*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child:widget ,

      ),
    );
  }
}