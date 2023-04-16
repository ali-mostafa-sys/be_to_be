import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:be_to_be/features/upgrade/presentation/bloc/upgrade_bloc/upgrade_bloc.dart';
import 'package:be_to_be/features/upgrade/presentation/widgets/show_sub_dialog_widget.dart';
import 'package:be_to_be/features/upgrade/presentation/widgets/show_upgrade_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => di.sl<UpgradeBloc>()..add(GetAllPackageEvent()),

      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            width: 0,
            height: 0,
          ),
          backgroundColor: primaryColor,
          title: Text('Upgrade'),
        ),
        body: BlocConsumer<MainPageBloc,MainPageState>(

          listener: (context,state){},
          builder: (context,state){
            var mBloc=MainPageBloc.get(context);
            return BlocConsumer<UpgradeBloc, UpgradeState>(
              listener: (context, state) {
                print(state );
                ///
                /// here for show the user pop up if he is already subscription
                ///

                if(state is LoadedGetAllPackageState){
                  if(mBloc.packageUsedEntity!=null){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowSubDialogWidget(
                            packagerName: mBloc.packageName,
                          );
                        });
                  }
                }

                ///
                ///
                ///
                if(state is OnShowUpgradeDialogState){

                 // if(mBloc.packageUsedEntity==null){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowUpgradeDialogWidget(
                            subscriptionPackageId: state.subscriptionPackageId,
                          );
                        });
               //   }




                }
                if(state is ErrorPostSubscribeState){
                  SnackBarMessage().showSnackBar(
                      message: state.error,
                      backgroundColor: Colors.redAccent,
                      context: context);
                }
              },
              builder: (context, state) {
                var upgradeBloc=UpgradeBloc.get(context);
                if(state is LoadingGetAllPackageState){
                  return const LoadingWidget();
                }
                if(state is ErrorGetAllPackageState){
                  return  ErrorPageWidget(errorText: state.error, onTap: (){
                    upgradeBloc.add(GetAllPackageEvent());
                  });
                }
                if(upgradeBloc.allPackage==null){
                  return const LoadingWidget();
                }
                return BackgroundWidget(
                  widgets: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Container(
                        width: w * 0.3,
                        height: w * 0.3,
                        child: Image.asset(
                          'assets/images/rocket.png',
                          width: w,
                        ),
                      ),
                      Container(
                        width: w*0.4,
                        child: Text(
                          'Upgrade your Package!',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: w*0.05,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: h*0.01),
                        width: w,
                        //color: Colors.red,
                        height: h*0.578,
                        child:  ListView.separated(
                            itemBuilder: (context, index) => UpgradeWidgetPage(
                                upgradeEntity:upgradeBloc.allPackage![index]! ,context: context,index: index,isSelected: upgradeBloc.isSelectedList[index],
                                month: upgradeBloc.month[index]

                            ),
                            separatorBuilder: (context,index)=>Container(
                              height: h*0.02,
                            ),
                            itemCount: upgradeBloc.allPackage.length),
                      ),


                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );

  }
  Widget UpgradeWidgetPage( {
  required BuildContext context ,
    required UpgradeEntity upgradeEntity,
    required int index,
    required bool isSelected,
    required int month,
}){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var upgradeBloc=UpgradeBloc.get(context);
    return InkWell(
      onTap: (){
        upgradeBloc.add(IsSelectedContainerEvent(index: index));
      },
      child: Container(
        width: w*0.9,
        height: h*0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: w*0.1),
                    child: Text(upgradeEntity.nameEn,
                      style: TextStyle(
                        color: HexColor('#A8A8A8'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: w*0.1),
                    child: Row(
                      children: [
                        Text('\$ ${upgradeEntity.priceUsd}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: w*0.05
                          ),
                        ),
                        Text('/Month',
                          style: TextStyle(
                              color: HexColor('#A8A8A8'),
                              fontSize: w*0.03
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: w*0.1),
                    child: Text('${month} Months',
                      style: TextStyle(
                          color: HexColor('#A8A8A8'),
                          fontSize: w*0.03
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: w*0.1),
                    child: Text('${upgradeEntity.features[1].featureValue} Tenders',
                      style: TextStyle(
                          color: HexColor('#A8A8A8'),
                          fontSize: w*0.03
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: w*0.1),
                    child: Text('${upgradeEntity.features[0].featureValue} Tenders per day',
                      style: TextStyle(
                          color: HexColor('#A8A8A8'),
                          fontSize: w*0.03
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isSelected!=false?
                  Row(
                    children: [
                      Spacer(),
                      Image.asset('assets/images/corner_container.png',width: w*0.1,height: w*0.1,),

                    ],
                  ):Container(),
                  Spacer(),
                  Container(
                    width:w*0.3,
                    child: ButtonTextWidget(
                        padding: 0,
                        backgroundColor: isSelected!=false?
                        primaryColor:Colors.white,
                        text: 'Buy',
                        textColor:isSelected!=false?
                        Colors.white:primaryColor,
                        textSize: w*0.05,
                        onPressed: (){
                          upgradeBloc.add(ShowUpgradeDialogWidgetEvent(index: index));
                        }),

                  ),
                  SizedBox(
                    height: h*0.01,
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
