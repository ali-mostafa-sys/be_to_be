import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/drawer_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget({Key? key,required this.isLoggedEntity}) : super(key: key);
   IsLoggedEntity? isLoggedEntity;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc,MainPageState>(
        listener: (context ,state){
          if(state is LogOutHomeState){
            AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route)=>false);
          }
        },
        builder: (context ,state){
          var mainBloc=MainPageBloc.get(context);
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
                                  start: w*0.1,
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
                                    ),),
                                  SizedBox(
                                    height: h*0.01,
                                  ),
                                  Text(
                                    mainBloc.packageName!=''?
                                    'Your package is  ${mainBloc!.packageName}':'You are not Premium',
                                    style: TextStyle(
                                        fontSize: w*0.05,
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            )


                          ],
                        ),

                      ),
                      /// here upgrade

                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/upgrade');
                      },
                          icon: Icon(Icons.star_sharp,color: Colors.amber,),
                         // path: 'assets/images/premium.png',
                          text: 'Upgrade'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here chooseTender
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/chooseTender');
                      },
                          icon: Icon(Icons.streetview,color: Colors.black,),
                          //path: 'assets/images/premium.png',
                          text: 'My Interests'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here createTender
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/createTender');
                      },
                          icon: Icon(Icons.create_outlined,color: Colors.black,),

                          text: 'Add Product'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// HERE FOR HISTORY
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/history');
                      },
                          icon: Icon(Icons.history_edu_outlined,color: Colors.black,),

                          text: 'Your History '),
                      SizedBox(
                        height: h*0.01,
                      ),


                      /// here 'About Us

                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/aboutUs');
                      }, path: 'assets/images/about_us.png', text: 'About Us'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here 'Contact Us
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/contactUs');
                      }, path: 'assets/images/contact_us.png', text: 'Contact Us'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here Terms & Conditions
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/terms');
                      }, path: 'assets/images/term.png', text: 'Terms & Conditions'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here Privacy
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/privacy');
                      }, path: 'assets/images/privacy.png', text: 'Privacy'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here FAQ
                      DrawerButtonWidget(onTap: (){
                        AutoRouter.of(context).pushNamed('/faq');
                      }, path: 'assets/images/help.png', text: 'FAQ'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here Rate Us
                      DrawerButtonWidget(onTap: (){}, path: 'assets/images/rate.png', text: 'Rate Us'),
                      SizedBox(
                        height: h*0.01,
                      ),
                      /// here Sign Out
                      DrawerButtonWidget(onTap: (){
                        mainBloc.add(LogeOutHomeEvent());
                      }, path: 'assets/images/logout.png', text: 'Sign Out'),
                      SizedBox(
                        height: h*0.01,
                      ),





                    ],
                  ),
                )),

          );
        },

    );
  }
}
