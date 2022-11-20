import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstPackageTextWidget extends StatelessWidget {
   FirstPackageTextWidget({Key? key,required this.remainTender,required this.numberOfTender}) : super(key: key);
  String remainTender;
  String numberOfTender;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: w * 0.3,
          height: h * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Remaining Tenders',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: HexColor('#909090'), fontSize: w * 0.04),
              ),
              Text(
                remainTender,
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
                'Number of tenders  available today',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#909090'),
                  fontSize: w * 0.04,
                ),
              ),
              Text(
                numberOfTender,
                style:
                    TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
