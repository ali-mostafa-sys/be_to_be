import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/presntation/widget/drawer_button_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget({Key? key,required this.isLoggedEntity}) : super(key: key);
   IsLoggedEntity? isLoggedEntity;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Drawer(
      child: BackgroundWidget(
          widgets: SingleChildScrollView(
            child: Column(
        children: [
            Container(
              height:h*0.53 ,
              width: w,
              child: Stack(
                children: [
                  Image.asset('assets/images/drawer.png',width: w,fit: BoxFit.cover,),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                      start: w*0.25,
                      top: h*0.05
                    ),
                    child: Image.asset('assets/images/logo.png',width: w*0.3,),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                      start: w*0.2,
                        top: h*0.25
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${isLoggedEntity!.firstName} ${isLoggedEntity!.lastName}',
                        style: TextStyle(
                          fontSize: w*0.08,
                          color: Colors.white
                        ),),
                        Text('${isLoggedEntity!.email}',
                          style: TextStyle(
                              fontSize: w*0.05,
                              color: Colors.white
                          ),)
                      ],
                    ),
                  )


                ],
              ),

            ),

            DrawerButtonWidget(onTap: (){}, path: 'assets/images/about_us.png', text: 'About Us'),
            SizedBox(
              height: h*0.01,
            ),
            DrawerButtonWidget(onTap: (){}, path: 'assets/images/contact_us.png', text: 'Contact Us'),
            SizedBox(
              height: h*0.01,
            ),
            DrawerButtonWidget(onTap: (){}, path: 'assets/images/term.png', text: 'Terms & Conditions'),
            SizedBox(
              height: h*0.01,
            ),
            DrawerButtonWidget(onTap: (){}, path: 'assets/images/privacy.png', text: 'Privacy'),
            SizedBox(
              height: h*0.01,
            ),
            DrawerButtonWidget(onTap: (){}, path: 'assets/images/help.png', text: 'FAQ'),
            SizedBox(
              height: h*0.01,
            ),
            DrawerButtonWidget(onTap: (){}, path: 'assets/images/rate.png', text: 'Rate Us'),
          SizedBox(
            height: h*0.01,
          ),
          DrawerButtonWidget(onTap: (){}, path: 'assets/images/logout.png', text: 'Sign Out'),
          SizedBox(
            height: h*0.01,
          ),





        ],
      ),
          )),

    );
  }
}
