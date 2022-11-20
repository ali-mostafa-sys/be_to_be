import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/drawer_widget.dart';
import 'package:be_to_be/features/home/presntation/widget/package_main_dialog_widget.dart';
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
            currentIndex: mainBloc.currentIndex,
            onTap: (index) {
              mainBloc
                  .add(ChangeBottomNavigationBarEvent(currentIndexPage: index));
            },
            items: mainBloc.bottomNavItems,
          ),
          drawer: DrawerWidget(isLoggedEntity: mainBloc.isLoggedEntity),
          appBar: AppBar(
            title: Text(
              mainBloc.appBarTitle[mainBloc.currentIndex],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: primaryColor,
            titleSpacing: 0,
            actionsIconTheme: IconThemeData(size: 3),
            actions: [
              Row(
                children: [
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
                  InkWell(
                    onTap: () {
                      print('notification');
                    },
                    child: Image.asset('assets/images/notification.png'),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  mainBloc.appBarTitle[mainBloc.currentIndex] != 'Profile'
                      ? mainBloc.appBarTitle[mainBloc.currentIndex] != 'Premium'
                          ? InkWell(
                              onTap: () {
                                print('sort');
                              },
                              child: Image.asset('assets/images/sort.png'),
                            )
                          : Container()
                      : Container(),
                  mainBloc.appBarTitle[mainBloc.currentIndex] != 'Profile'
                      ? mainBloc.appBarTitle[mainBloc.currentIndex] != 'Premium'
                          ? SizedBox(
                              width: w * 0.05,
                            )
                          : Container()
                      : Container(),
                ],
              )
            ],
          ),
          body: mainBloc.screenOfBNB[mainBloc.currentIndex],
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
