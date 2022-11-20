import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:flutter/material.dart';



class DrawerButtonWidget extends StatelessWidget {
   DrawerButtonWidget({Key? key,required this.onTap,required this.path,required this.text}) : super(key: key);

  void Function()? onTap;
  String path;
  String text;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h*0.07,
      child: InkWell(
        onTap: onTap,
        child: BackgroundWidget(widgets: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(path),
            ),

            Text(text)
          ],
        )),
      ),
    );
  }
}
