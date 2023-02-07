import 'package:flutter/material.dart';



class RowSortWidget extends StatelessWidget {
   RowSortWidget({Key? key,
  required this.path,
  required this.text,
  required this.onTap,

  }) : super(key: key);
  String path;
  String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w*0.01),

        width: w,
        height: h*0.05,
        decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
        ),
        child: Row(
          children: [
            Image.asset(path),
            SizedBox(
              width: w*0.03,
            ),
            Text(text),

          ],
        ),
      ),
    );
  }
}
