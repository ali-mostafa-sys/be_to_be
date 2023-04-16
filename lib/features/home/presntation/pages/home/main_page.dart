import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/choose_tender_dialog_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/create_page_dialog_widget.dart';

import 'package:be_to_be/features/home/presntation/widget/drawer_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/notification_main_dialog_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/package_main_dialog_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/row_sort_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/sort_widget.dart';
import 'package:be_to_be/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
        print(state);
        if(state is LoadedIsLoggedState){
          if(state.chooseTender==null){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChooseTenderDialogWidget();
                });
          }else{
            return ;
          }
        }

        if(state is PackagePopupState){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return PackageMainDialogWidget(

                );
              });
        }

        if(state is ChangePremiumBottomNavigationBarState){

          if(state.currentPremiumIndexPage==4){

            if(MainPageBloc.get(context). packageUsedEntity==null){
              AutoRouter.of(context).pushNamed('/upgrade');
              SnackBarMessage().showSnackBar(message: 'Upgrade your account first to be able to create Tenders', backgroundColor: Colors.redAccent, context: context);
              Future.delayed(Duration(seconds: 1)).then((value) {
                MainPageBloc.get(context).add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  2));
              });
            }else{
              MainPageBloc.get(context).createPage=true;
            }
          }

        }

        if(state is CreatePageState){
          if(state.createPage==true){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ShowCreatePageDialogWidget(

                  );
                });
          }

        }

      },
      builder: (context, state) {
        var mainBloc = MainPageBloc.get(context);
        if (state is LoadingIsLoggedState) {
          return const LoadingWidget();
        }
        return Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:
            //mainBloc.isPremium==false?
           // mainBloc.currentIndex:
            mainBloc.currentIndexPremium,
            onTap: (index) {
             // mainBloc.isPremium==false?
             // mainBloc
               //   .add(ChangeBottomNavigationBarEvent(currentIndexPage: index)):
              mainBloc.add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  index))
              ;
            },
            items:
            //mainBloc.isPremium==false?
           // mainBloc.bottomNavItems:
            mainBloc.bottomNavPremiumItems
            ,
          ),
          drawer: DrawerWidget(isLoggedEntity: mainBloc.isLoggedEntity),
          appBar: AppBar(

            title: Text(
             // mainBloc.isPremium==false?
            //  mainBloc.appBarTitle[mainBloc.currentIndex]:
              mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium],
              style:const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: primaryColor,
            titleSpacing: 0,
            actionsIconTheme:const IconThemeData(size: 3),
            actions: [
            //  mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium]!='Upgrade'?

              Row(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     print('Premium');
                  //     mainBloc.add(NormalUserEvent());
                  //   },
                  //   child:const Text('premium'),
                  // ),
                  /// here for package
                  InkWell(
                    onTap: () {
                      print('package');
                      mainBloc.add(PackagePopupEvent());
                    },
                    child: Image.asset('assets/images/packageUsage.png'),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  /// here for notification
                  BlocProvider(
                      create: (context)=>di.sl<NotificationBloc>(),
                    child: BlocConsumer<NotificationBloc,NotificationState>(
                      listener: (context,state){
                        print(state );
                        if(state is LoadedGetNotificationState){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NotificationMainDialogWidget(
                                  notificationList: state.notificationList,

                                );
                              });
                        }

                      },
                      builder: (context,state){
                        var notBloc=NotificationBloc.get(context);
                        return InkWell(
                          onTap: () {
                            notBloc.add(GetNotificationEvent());
                            // print('ok');

                          //  AutoRouter.of(context).pushNamed('/notification');
                            print('notification');
                          },
                          child: Image.asset('assets/images/notification.png'),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  /// here for sort
                  mainBloc.appBarTitle[mainBloc.currentIndex] != 'Profile'
                      ? mainBloc.appBarTitle[mainBloc.currentIndex] != 'Premium'
                          ?mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium] != 'Create Tender'
                      ?mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium] != 'Profile'?

                  InkWell(
                              onTap: () {


                                  mainBloc.add(ShowBottomSheetSortEvent());
                                  mainBloc.isShowSort==true?
                                  scaffoldKey.currentState!.showBottomSheet(

                                        (context) => SortWidget(scaffoldKey: scaffoldKey),

                                  ).closed.then((value) {
                                    mainBloc.add(ShowBottomSheetSortEvent());
                                  }):scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                                    width: 0,
                                    height: 0,
                                  ));

                                print('sort');
                              },
                              child: Image.asset('assets/images/sort.png'),
                            ):Container()
                          : Container()
                          : Container()
                      : Container(),
                  mainBloc.appBarTitle[mainBloc.currentIndex] != 'Profile'
                      ? mainBloc.appBarTitle[mainBloc.currentIndex] != 'Premium'
        ?mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium] != 'Create Tender'
        ?mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium] != 'Profile'?
                           SizedBox(
                              width: w * 0.05,
                            )
                          : Container()
                          : Container()
                          : Container()
                      : Container(),
                ],
              ),
                 // :Container(),
            ],
          ),
          body:
          //mainBloc.isPremium==false?
         // mainBloc.screenOfBNB[mainBloc.currentIndex]:
          mainBloc.screenOfPremiumBNB[mainBloc.currentIndexPremium],
        );
      },
    );
  }


}

