

import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/home/presntation/widget/row_sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SortWidget extends StatelessWidget {
   SortWidget({Key? key,required this.scaffoldKey}) : super(key: key);
  var scaffoldKey;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<MainPageBloc,MainPageState>(
         listener: (context,state){},
         builder: (context,state){
           var mainBloc=MainPageBloc.get(context);
           return Container(
             width: w,height: h*0.53,

             decoration: BoxDecoration(

                 borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))

             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,

               children: [
                 IconButton(onPressed: (){
                   mainBloc.add(ShowBottomSheetSortEvent());
                   scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                     width: 0,
                     height: 0,
                   ));
                 }, icon: Icon(Icons.keyboard_arrow_down_sharp,size: w*0.1,)),
                 SizedBox(
                   height: h*0.00,
                 ),
                 const  Text('Sort By',style: TextStyle(

                 ),),
                 SizedBox(
                   height: h*0.015,
                 ),
                 /// here for rate sort

                 RowSortWidget(path: 'assets/images/rate.png', text: 'Rate', onTap: (){
                   mainBloc.add(const SortButtonEvent(sortValue: 'Rate'));
                   Future.delayed(Duration(microseconds: 1)).then((value) {
                     mainBloc.add(ShowBottomSheetSortEvent());
                     scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                       width: 0,
                       height: 0,
                     ));
                   });
                 }),
                 SizedBox(
                   height:  h*0.015,
                 ),
                 /// here for quantity sort

                 RowSortWidget(path: 'assets/images/building_row_order.png', text: 'Quantity', onTap: (){
                   mainBloc.add(const  SortButtonEvent(sortValue: 'Quantity'));
                   Future.delayed(Duration(microseconds: 1)).then((value) {
                     mainBloc.add(ShowBottomSheetSortEvent());
                             scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                               width: 0,
                               height: 0,
                             ));
                   });
                 }),
                 SizedBox(
                   height:  h*0.015,
                 ),
                 /// here for Latest Time sort

                 RowSortWidget(path: 'assets/images/clock.png', text: 'Latest Time', onTap: (){
                   mainBloc.add(const SortButtonEvent(sortValue: 'Latest Time'));
                   Future.delayed(Duration(microseconds: 1)).then((value) {
                     mainBloc.add(ShowBottomSheetSortEvent());
                     scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                       width: 0,
                       height: 0,
                     ));
                   });
                 }),
                 SizedBox(
                   height:  h*0.015,
                 ),
                 /// here for price sort

                 RowSortWidget(path: 'assets/images/dollar.png', text: 'Price', onTap: (){
                   mainBloc.add(const SortButtonEvent(sortValue: 'Price'));
                   Future.delayed(Duration(microseconds: 1)).then((value) {
                     mainBloc.add(ShowBottomSheetSortEvent());
                     scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                       width: 0,
                       height: 0,
                     ));
                   });
                 }),
                 SizedBox(
                   height:  h*0.015,
                 ),
                 /// here for delivery sort

                 RowSortWidget(path: 'assets/images/delivery.png', text: 'Include Delivery', onTap: (){
                   mainBloc.add(const SortButtonEvent(sortValue: 'Include Delivery'));
                   Future.delayed(Duration(microseconds: 1)).then((value) {
                     mainBloc.add(ShowBottomSheetSortEvent());
                     scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                       width: 0,
                       height: 0,
                     ));
                   });
                 }),
                 // SizedBox(
                 //   height:  h*0.015,
                 // ),
                 // Container(
                 //   width: w*0.3,
                 //   child: ButtonTextWidget(
                 //       padding: 0
                 //       , backgroundColor: primaryColor,
                 //       text: 'Sort',
                 //       textColor: Colors.white,
                 //       textSize: w*0.02,
                 //       onPressed: (){
                 //         mainBloc.add(ShowBottomSheetSortEvent());
                 //         scaffoldKey.currentState!.showBottomSheet((context)=> Container(
                 //           width: 0,
                 //           height: 0,
                 //         ));
                 //       }),
                 // )


               ],
             ),
           );
         },

    );
  }
}
