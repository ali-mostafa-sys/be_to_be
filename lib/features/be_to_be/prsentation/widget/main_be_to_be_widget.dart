import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/be_to_be_row_widget.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/company_inf_widget.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


class MainBeToBeWidget extends StatelessWidget {
  MainBeToBeWidget({Key? key,
    required this.toExpand,
    required this.closeExpand,
    required this.onExpanded,
    required this.data,
    required this.loading,
    required this.isPending,
   // required this.city,


    required this.onAccepted}) : super(key: key);

  void Function()? toExpand;
  void Function()? closeExpand;
  void Function()? onAccepted;

  BeToBeEntity data;

  bool onExpanded=false;
  bool loading=false;
  bool isPending;
  //String city;





  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<BeToBeBloc,BeToBeState>(
      listener: (context,state){

      },
      builder: (context,state){
        var beToBeBloc=BeToBeBloc.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.2,
                width: w,
                color: HexColor('#EEEEEE'),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// here for image/////////////////////////////////////////////
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: w * 0.03),
                      child: Image.asset('assets/images/lap.png'),
                    ),
                    SizedBox(
                      width: w * 0.06,
                    ),

                    /// here data for/////////////////////////
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data.categoryName}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: w * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${data.brandName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: w * 0.04,
                          ),
                        ),
                        Text(
                          '${data.productName}',
                          style: TextStyle(
                            color: HexColor('#7B7B7B'),
                            fontSize: w * 0.035,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    /// here for expanded the widget just implemented
                   loading==true?const LoadingWidget():
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: w * 0.02),
                      child: InkWell(
                        onTap: toExpand,
                        child: Image.asset(
                          'assets/images/dotes.png',
                          width: w * 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onExpanded == true
                  ? Container(
                width: w,
               // height: h * 0.8,
                color: HexColor('#D1D1D1'),
                child: Column(

                  children: [

                    SizedBox(
                      height: h*0.02,
                    ),
                    /// here for general info
                    Container(
                      width: w,
                      height: h*0.35,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return ContainerWidget(
                              widget: Padding(
                                padding:  EdgeInsetsDirectional.only(start: w*0.05,top: h*0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Offer Info',style: TextStyle(
                                        fontSize: w*0.04,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    /// done
                                    BeToBeRowWidget(
                                        title: 'Include Delivery',
                                        //${orderEntity.area}-${orderEntity.street}
                                        data: beToBeBloc.offersList[index].bIncludeDelivery==0?"No": ' Yes',
                                        hasText: false,
                                        hasBuilding: false),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    /// done
                                    BeToBeRowWidget(
                                        title: 'Quantity',
                                        //${orderEntity.area}-${orderEntity.street}
                                        data: '  ${beToBeBloc.offersList[index].quantity}',
                                        hasText: false,
                                        hasBuilding: true),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: w*0.25),
                                      child: ButtonTextWidget(
                                          padding: 0,
                                          backgroundColor: primaryColor,
                                          text: 'More details >>>',
                                          textColor: Colors.white,
                                          textSize: w*0.04,
                                          onPressed:(){
                                         //   context.router.push(MoreInfoB2BPage());
                                            AutoRouter
                                                .of(context)
                                                .push(MoreInfoB2BPage(offersOnTendersB2BEntity:beToBeBloc.offersList[index],isPending: isPending,userTenderId:data.tenderCreatorUserId));


                                          }
                                         // closeExpand
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context,index)=>SizedBox(height: h*0.01,),
                          itemCount: beToBeBloc.offersList.length),
                    ),
                    SizedBox(
                      height: h*0.02,
                    ),
                   // /// here for payment info
                    // ContainerWidget(
                    //   widget: Padding(
                    //     padding:  EdgeInsetsDirectional.only(start: w*0.05,top: h*0.01),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('Payment Info',style: TextStyle(
                    //             fontSize: w*0.04,
                    //             fontWeight: FontWeight.bold
                    //         ),
                    //         ),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         BeToBeRowWidget(
                    //             title: 'Delivery Cost',
                    //             //${orderEntity.area}-${orderEntity.street}
                    //             data: ' \$ 150',
                    //             hasText: false,
                    //             hasBuilding: false),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         BeToBeRowWidget(
                    //             title: 'Include VAT/TAX',
                    //             //${orderEntity.area}-${orderEntity.street}
                    //             data: '  Yes',
                    //             hasText: false,
                    //             hasBuilding: false),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         BeToBeRowWidget(
                    //             title: 'VAT In Percent ',
                    //             //${orderEntity.area}-${orderEntity.street}
                    //             data: '  5 \% ',
                    //             hasText: true,
                    //             hasBuilding: false),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         BeToBeRowWidget(
                    //             title: 'Item Price',
                    //             //${orderEntity.area}-${orderEntity.street}
                    //             data: ' \$ 250',
                    //             hasText: false,
                    //             hasBuilding: false),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         BeToBeRowWidget(
                    //             title: 'Total Price ',
                    //             //${orderEntity.area}-${orderEntity.street}
                    //             data: '  \$ 525',
                    //             hasText: false,
                    //             hasBuilding: false),
                    //
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: h*0.02,
                    // ),
                    // /// here for company info
                    // ContainerWidget(
                    //   widget: Padding(
                    //     padding:  EdgeInsetsDirectional.only(start: w*0.05,top: h*0.01),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('Companies Info',style: TextStyle(
                    //             fontSize: w*0.04,
                    //             fontWeight: FontWeight.bold
                    //         ),
                    //         ),
                    //         SizedBox(
                    //           height: h * 0.02,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //                 child: Column(
                    //
                    //               children: [
                    //                 CompanyInfoWidget(path: 'assets/images/building.png', text: 'AAAAAA'),
                    //                 SizedBox(
                    //                   height: h*0.02,
                    //                 ),
                    //                 CompanyInfoWidget(path: 'assets/images/company_info_phone.png', text: '21241231231'),
                    //                 SizedBox(
                    //                   height: h*0.02,
                    //                 ),
                    //                 CompanyInfoWidget(path: 'assets/images/location_1.png', text: 'UAE - Dubai'),
                    //
                    //               ],
                    //             ),),
                    //             SizedBox(
                    //               width: w*0.01,
                    //             ),
                    //             Container(
                    //               width: 1,
                    //               height: h*0.2,
                    //               color: Colors.grey,
                    //             ),
                    //             SizedBox(
                    //               width: w*0.01,
                    //             ),
                    //             Expanded(
                    //               child: Column(
                    //                 children: [
                    //                   CompanyInfoReWidget(path: 'assets/images/building.png', text: 'AAAAAA'),
                    //                   SizedBox(
                    //                     height: h*0.02,
                    //                   ),
                    //                   CompanyInfoReWidget(path: 'assets/images/company_info_phone.png', text: '21241231231'),
                    //                   SizedBox(
                    //                     height: h*0.02,
                    //                   ),
                    //                   CompanyInfoReWidget(path: 'assets/images/location_1.png', text: 'UAE - Dubai'),
                    //
                    //                 ],
                    //               ),),
                    //           ],
                    //         ),
                    //
                    //
                    //
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: h * 0.02,
                    // ),
                    // /// here for delivered button
                    // Padding(
                    //   padding:  EdgeInsets.symmetric(horizontal: w*0.3),
                    //   child: ButtonTextWidget(
                    //       padding: 0,
                    //       backgroundColor: primaryColor,
                    //       text: 'Delivered',
                    //       textColor: Colors.white,
                    //       textSize: w*0.04,
                    //       onPressed: closeExpand),
                    // ),
                    // SizedBox(
                    //   height: h * 0.02,
                    // ),

                  ],
                ),
              )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}









