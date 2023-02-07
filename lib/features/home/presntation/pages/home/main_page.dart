import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/choose_tender_dialog_widget.dart';

import 'package:be_to_be/features/home/presntation/widget/drawer_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/package_main_dialog_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/row_sort_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
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
      },
      builder: (context, state) {
        var mainBloc = MainPageBloc.get(context);
        if (state is LoadingIsLoggedState) {
          return const LoadingWidget();
        }
        return Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:mainBloc.isPremium==false? mainBloc.currentIndex:mainBloc.currentIndexPremium,
            onTap: (index) {
              mainBloc.isPremium==false?
              mainBloc
                  .add(ChangeBottomNavigationBarEvent(currentIndexPage: index)):
              mainBloc
                  .add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  index))
              ;
            },
            items:mainBloc.isPremium==false?
            mainBloc.bottomNavItems:
            mainBloc.bottomNavPremiumItems
            ,
          ),
          drawer: DrawerWidget(isLoggedEntity: mainBloc.isLoggedEntity),
          appBar: AppBar(
            title: Text(
              mainBloc.isPremium==false?
              mainBloc.appBarTitle[mainBloc.currentIndex]:mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: primaryColor,
            titleSpacing: 0,
            actionsIconTheme: IconThemeData(size: 3),
            actions: [
              mainBloc.premiumAppBarTitle[mainBloc.currentIndexPremium]!='Upgrade'?

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('Premium');
                      mainBloc.add(NormalUserEvent());
                    },
                    child:const Text('premium'),
                  ),
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
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pushNamed('/notification');
                      print('notification');
                    },
                    child: Image.asset('assets/images/notification.png'),
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
              ):Container(),
            ],
          ),
          body: mainBloc.isPremium==false?
          mainBloc.screenOfBNB[mainBloc.currentIndex]:mainBloc.screenOfPremiumBNB[mainBloc.currentIndexPremium],
        );
      },
    );
  }

  // AppBar _buildAppBar({required double w,required BuildContext context}) {
  //   return AppBar(
  //     title: Text(
  //       MainPageBloc.get(context).appBarTitle[MainPageBloc.get(context).currentIndex],
  //       style: TextStyle(
  //         color: Colors.white,
  //       ),
  //     ),
  //     backgroundColor: primaryColor,
  //     titleSpacing: 0,
  //
  //     actionsIconTheme: IconThemeData(size: 3),
  //     actions: [
  //      BlocConsumer<MainPageBloc,MainPageState>(
  //          listener: (context,state){
  //
  //          },
  //          builder: (context,state){
  //            var mainBloc=MainPageBloc.get(context);
  //            return  Row(
  //              children: [
  //                InkWell(
  //                  onTap: (){
  //                    MainPageBloc.get(context).add(PopUpPackageEvent());
  //                    print('package');
  //                  },
  //                  child: Image.asset('assets/images/packageUsage.png'),
  //
  //                ),
  //                SizedBox(
  //                  width: w*0.05,
  //                ),
  //                InkWell(
  //                  onTap: (){
  //                    print('notification');
  //                  },
  //                  child: Image.asset('assets/images/notification.png'),
  //
  //                ),
  //                SizedBox(
  //                  width: w*0.05,
  //                ),
  //                mainBloc.appBarTitle[mainBloc.currentIndex]!='Profile'?
  //            mainBloc.appBarTitle[mainBloc.currentIndex]!='Premium'?
  //
  //                InkWell(
  //                  onTap: (){
  //                    print('sort');
  //                  },
  //                  child: Image.asset('assets/images/sort.png'),
  //
  //                ):Container():Container(),
  //                mainBloc.appBarTitle[mainBloc.currentIndex]!='Profile'?
  //                mainBloc.appBarTitle[mainBloc.currentIndex]!='Premium'?
  //                SizedBox(
  //                  width: w*0.05,
  //                ):Container():Container(),
  //              ],
  //            );
  //          },
  //      ),
  //
  //
  //
  //     ],
  //   );
  // }

  // Drawer _buildDrawer() {
  //   return DrawerWidget();
  // }
}

// TODO: BVB 4 FOR FREE USER AND 5 FOR PAID
