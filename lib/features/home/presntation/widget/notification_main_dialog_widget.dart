import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NotificationMainDialogWidget extends StatelessWidget {
  NotificationMainDialogWidget({Key? key,required this.notificationList }) : super(key: key);
  bool isPop = true;
  List<NotificationEntity> notificationList;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
        print(state);


      },
      builder: (context, state) {
        var mainBloc = MainPageBloc.get(context);


        return WillPopScope(
          onWillPop: () async => isPop,

          child:SimpleDialog(


            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // backgroundColor: Colors.red,
            title: Text('Notifications',style: TextStyle(
                fontSize: w*0.05,
                color: primaryColor,
                fontWeight: FontWeight.bold
            ),),
            titlePadding: EdgeInsets.symmetric(vertical: h*0.015,horizontal: w*0.05),

            children: [
              const  Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h*0.01,
                  ),
                  Container(
                    width: w,
                    height: h*0.8,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          print(notificationList);
                        },
                        child:ListView.separated(
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){

                                  if(notificationList[index].title=='New Offer'){
                                    mainBloc.add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  1));

                                    AutoRouter.of(context).pop();
                                   // AutoRouter.of(context).pushNamed('/offer');
                                    //  AutoRouter.of(context).pushAndPopUntil(OfferPage(), predicate: (route) => false);
                                  }else if(notificationList[index].title=='New Tender'){
                                    mainBloc.add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  3));

                                    AutoRouter.of(context).pop();
                                    //AutoRouter.of(context).pushNamed('/order');
                                    // AutoRouter.of(context).pushAndPopUntil(OrderPage(), predicate: (route) => false);
                                  }
                                  // notBloc.add(ReadNotificationEvent(notificationsIds: notBloc.notificationList[index].notificationId,index: index));
                                  print(notificationList[index].notificationId);

                                },
                                child: Container(
                                  color: notificationList[index].readAt==null?null:primaryColor.withOpacity(0.1),
                                  width: w,
                                  height: h*0.18,
                                  child: ListTile(
                                    leading:SizedBox(
                                        width: w*0.13,
                                        height: w*0.2,
                                        child: notificationList[index].imgUrl==null?Image.asset('assets/images/logo.png',fit: BoxFit.contain,):Image.network('${notificationList[index].imgUrl}',fit: BoxFit.contain,)) ,
                                    title: Text(notificationList[index].title),
                                    subtitle:  Text(notificationList[index].content),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context,index)=>Divider(
                              color: primaryColor,
                              thickness: 0.5,
                              indent: 20,
                              endIndent: 20,
                            ),
                            itemCount:notificationList.length),
                      ),
                    ),
                  ),



                ],
              ),



            ],
          ),
        );
      },
    );
  }
}