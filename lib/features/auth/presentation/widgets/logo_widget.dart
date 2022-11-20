import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Container(
      width: w*0.44,
      //146
      height: w*0.44,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/logo.png'))),
    );
  }
}
