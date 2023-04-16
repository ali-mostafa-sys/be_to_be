import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/order/domain/entity/my_offer_entity/mu_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/order/presentation/widget/row_expanded_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/show_offer_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class OrderMainWidget extends StatelessWidget {
   OrderMainWidget({Key? key,
     required this.toExpand,
     required this.closeExpand,
     required this.onExpanded,
     required this.orderEntity,
     required this.deliveryTimePeriod,
     required this.maxTenderPeriod,
     required this.myOfferEntity,
     required this.loadingWidget,

     required this.onAccepted}) : super(key: key);

  void Function()? toExpand;
   void Function()? closeExpand;
   void Function()? onAccepted;

   MyOfferEntity?myOfferEntity;
   bool loadingWidget = false;

   bool onExpanded=false;
   GetOrderEntity orderEntity;
   String deliveryTimePeriod;
   String maxTenderPeriod;




   @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<OrderBloc,OrderState>(
         listener: (context,state){

         },
         builder: (context,state){
           var orderBloc=OrderBloc.get(context);
           return Column(
             children: [
               Container(
                 height: h * 0.2,
                 width: w,
                 color: HexColor('#EEEEEE'),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     //TODO: HERE MAKE IT RIGHT AFTER BACKEND CORRECT THE ERROR
                     // Padding(
                     //   padding: EdgeInsetsDirectional.only(start: w * 0.03),
                     //   child: Image.network('${orderEntity.productImgUrl}'),
                     // ),
                     SizedBox(
                       width: w * 0.06,
                     ),

                     /// here data for
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           orderEntity.categoryName,
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: w * 0.05,
                               fontWeight: FontWeight.bold),
                         ),
                         Text(
                           orderEntity.brandName,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: w * 0.04,
                           ),
                         ),
                         Text(
                           orderEntity.productName,
                           style: TextStyle(
                             color: HexColor('#7B7B7B'),
                             fontSize: w * 0.035,
                           ),
                         ),
                         Text(
                           orderEntity.name,
                           style: TextStyle(
                             color: HexColor('#7B7B7B'),
                             fontSize: w * 0.035,
                           ),
                         ),
                         Text(

                           DateFormat.yMd().format(
                             DateTime.parse(orderEntity.from),
                           ),
                           style: TextStyle(
                             color: HexColor('#7B7B7B'),
                             fontSize: w * 0.035,
                           ),
                         ),
                       ],
                     ),
                     Spacer(),

                     /// here for expanded the widget just implemented
                     Padding(
                       padding: EdgeInsetsDirectional.only(end: w * 0.02),
                       child: loadingWidget==true?const LoadingWidget():

                       InkWell(
                         onTap: toExpand,
                         child: Image.asset(
                           'assets/images/dotes.png',
                           width: w * 0.1,
                         ),
                       ),
                     )
                   ],
                 ),
               ),
               onExpanded == true
                   ? Container(
                 width: w,
                 height:myOfferEntity==null?h*0.36: h * 0.38,
                 color: HexColor('#D1D1D1'),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     myOfferEntity==null?
                     /// here for make offer
                     Column(
                       children: [
                         SizedBox(
                           height: h * 0.019,
                         ),
                         /// here for delivery address
                         orderEntity.area!=null?
                         RowExpandedWidget(
                             title: 'Delivery Address',
                             //${orderEntity.area}-${orderEntity.street}
                             data: ' ${orderEntity.area.toString()} - ${orderEntity.street.toString()}',
                             hasText: false,
                             hasBuilding: false):Container(),
                         orderEntity.area!=null?
                         SizedBox(
                           height: h * 0.01,
                         ):Container(),
                         /// here for Delivery Time Period
                         RowExpandedWidget(
                           title: ' Delivery Time Period',
                           data: deliveryTimePeriod,
                           hasText: true,
                           hasBuilding: false,
                         ),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         /// here for Maximum Tender Period
                         RowExpandedWidget(
                             title: ' Maximum Tender Period',
                             data: maxTenderPeriod,
                             hasText: true,
                             hasBuilding: false),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         /// here for Quantity
                         RowExpandedWidget(
                             title: ' Quantity',
                             data: orderEntity.quantity.toString(),
                             hasText: false,
                             hasBuilding: true),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(25),
                                 color: HexColor('#0BC524'),
                               ),

                               /// here for accept button
                               child: IconButton(
                                 onPressed: onAccepted,
                                 icon: Icon(Icons.check),
                                 iconSize: w * 0.08,
                                 color: Colors.white,
                               ),
                             ),

                             /// here for cancel button
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(25),
                                 color: HexColor('##D50000'),
                               ),
                               child: IconButton(
                                 onPressed: closeExpand,
                                 icon: Icon(Icons.clear),
                                 color: Colors.white,
                               ),
                             ),
                           ],
                         )
                       ],
                     ):
                     /// here for show my offer
                     Column(
                       children: [
                         SizedBox(
                           height: h * 0.01,
                         ),
                         Text('Your offer Imformayions',style: TextStyle(
                           color: primaryColor,
                           fontSize: w*0.05,
                           fontWeight: FontWeight.bold
                         ),),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         RowExpandedWidget(
                             title: 'Quantity',
                             //${orderEntity.area}-${orderEntity.street}
                             data: '${myOfferEntity!.quantity}',
                             hasText: false,
                             hasBuilding: true),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         RowExpandedWidget(
                             title: 'Price per Item',
                             //${orderEntity.area}-${orderEntity.street}
                             data: '${myOfferEntity!.priceUSD}\$',
                             hasText: false,
                             hasBuilding: false),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         RowExpandedWidget(
                             title: 'Include Delivery',
                             //${orderEntity.area}-${orderEntity.street}
                             data: myOfferEntity!.bIncludeDelivery==1?"Yes":'No',
                             hasText: false,
                             hasBuilding: false),
                         myOfferEntity!.bIncludeDelivery==1? SizedBox(
                           height: h * 0.01,
                         ):Container(),
                         myOfferEntity!.bIncludeDelivery==1?RowExpandedWidget(
                             title: 'Delivery cost',
                             //${orderEntity.area}-${orderEntity.street}
                             data: myOfferEntity!.bIncludeDelivery==1?"${ myOfferEntity!.deliveryCost}\$":'No',
                             hasText: false,
                             hasBuilding: false):Container(),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         RowExpandedWidget(
                             title: 'Include Tax',
                             //${orderEntity.area}-${orderEntity.street}
                             data: myOfferEntity!.tax!=null?"Yes":'No',
                             hasText: false,
                             hasBuilding: false),
                         myOfferEntity!.tax!=null? SizedBox(
                           height: h * 0.01,
                         ):Container(),
                         myOfferEntity!.tax!=null?RowExpandedWidget(
                             title: 'Tax/Vat',
                             //${orderEntity.area}-${orderEntity.street}
                             data: myOfferEntity!.tax!=null?"${ myOfferEntity!.tax}%":'0%',
                             hasText: false,
                             hasBuilding: false):Container(),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         /// here for delete offer
                         Container(
                           width: w*0.5,
                           child:
                           state is LoadingDeleteOfferOrderState?const LoadingWidget():

                           ButtonTextWidget(
                               padding: 0,
                               backgroundColor: Colors.redAccent,
                               text: 'Delete Offer',
                               textColor: Colors.white,
                               textSize: w*0.05,
                               onPressed: (){
                                 orderBloc.add(DeleteOfferOrderEvent(offerId:myOfferEntity!.idOffer));
                               }),
                         )


                       ],
                     ),



                   ],
                 ),
               )
                   : Container(),
             ],
           );
         },
    );
  }
}
