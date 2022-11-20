import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/order/presentation/widget/row_expanded_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/show_offer_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderMainWidget extends StatelessWidget {
   OrderMainWidget({Key? key,
     required this.toExpand,
     required this.closeExpand,
     required this.onExpanded,
     required this.orderEntity,

     required this.onAccepted}) : super(key: key);

  void Function()? toExpand;
   void Function()? closeExpand;
   void Function()? onAccepted;

   bool onExpanded=false;
   GetOrderEntity orderEntity;




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
                     Padding(
                       padding: EdgeInsetsDirectional.only(start: w * 0.03),
                       child: Image.asset('assets/images/lap.png'),
                     ),
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
                       ],
                     ),
                     Spacer(),

                     /// here for expanded the widget just implemented
                     Padding(
                       padding: EdgeInsetsDirectional.only(end: w * 0.02),
                       child: InkWell(
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
                 height: h * 0.3,
                 color: HexColor('#D1D1D1'),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     RowExpandedWidget(
                         title: 'Delivery Address',
                         //${orderEntity.area}-${orderEntity.street}
                         data: ' UAE - Dubai',
                         hasText: false,
                         hasBuilding: false),
                     SizedBox(
                       height: h * 0.01,
                     ),
                     RowExpandedWidget(
                       title: ' Delivery Time Period',
                       data: '10 ',
                       hasText: true,
                       hasBuilding: false,
                     ),
                     SizedBox(
                       height: h * 0.01,
                     ),
                     RowExpandedWidget(
                         title: ' Maximum Tender Period',
                         data: ' 7 ',
                         hasText: true,
                         hasBuilding: false),
                     SizedBox(
                       height: h * 0.01,
                     ),
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
                 ),
               )
                   : Container(),
             ],
           );
         },
    );
  }
}
