import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context)=>di.sl<NotificationBloc>()..add(GetNotificationEvent()),
        child: BlocConsumer<NotificationBloc,NotificationState>(

          listener: (context,state){
            print(state);
            if(state is LoadedReadState){
              if(state.notificationList[state.index].title=='New Offer'){
                AutoRouter.of(context).pushNamed('/offer');
                //  AutoRouter.of(context).pushAndPopUntil(OfferPage(), predicate: (route) => false);
              }else if(state.notificationList[state.index].title=='New Tender'){
                AutoRouter.of(context).pushNamed('/order');
                // AutoRouter.of(context).pushAndPopUntil(OrderPage(), predicate: (route) => false);
              }
              NotificationBloc.get(context).add(GetNotificationEvent());

            }

          },
          builder: (context,state){
            var notBloc=NotificationBloc.get(context);
            if(state is LoadingGetNotificationState){
              return LoadingWidget();

            }
            if(state is LoadingReadState){
              return LoadingWidget();
            }
            return SafeArea(
                child: BackgroundWidget(
              widgets: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: h*0.05,
                    ),
                    Container(
                      height: h,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                notBloc.add(ReadNotificationEvent(notificationsIds: notBloc.notificationList[index].notificationId,index: index));
                                print(notBloc.notificationList[index].notificationId);

                              },
                              child: Container(
                                color: notBloc.notificationList[index].readAt==null?null:primaryColor.withOpacity(0.1),
                                width: w,
                                height: h*0.15,
                                child: ListTile(
                                  leading:Container(
                                      width: w*0.13,
                                      height: w*0.2,
                                      child: notBloc.notificationList[index].imgUrl==null?Image.asset('assets/images/logo.png',fit: BoxFit.contain,):Image.network('${notBloc.notificationList[index].imgUrl}',fit: BoxFit.contain,)) ,
                                  title: Text('${notBloc.notificationList[index].title}'),
                                  subtitle:  Text('${notBloc.notificationList[index].content}'),
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
                          itemCount: notBloc.notificationList.length),
                    ),
                    SizedBox(
                      height: h*0.05,
                    ),

                  ],
                ),
              ),
            )
            );
          },

        ),

      ),
    );

  }
}
