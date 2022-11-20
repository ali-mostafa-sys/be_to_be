import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/up_page_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_verification_company_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/company_information/presentation/widgets/show_tender_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyPositionPage extends StatelessWidget {
  CompanyPositionPage({Key? key}) : super(key: key);


  // LatLng? markerLocation;
  // Marker? myMarker;

  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

        return Scaffold(
          body: _buildBody(h: h,w: w),
        );
  }
  Widget _buildBody({required double h,required double w}){
    return BlocConsumer<CompanyInformationBloc,CompanyInformationState>(
         listener: (context,state){
           print(state);

         },
         builder: (context,state){
           var bloc = CompanyInformationBloc.get(context);
           return Padding(
             padding: EdgeInsets.only(top: h * 0.036),
             child: BackgroundWidget(
               widgets: Stack(
                 children: [
                   UpPageWidget(
                     title: "Company Info ",
                     text: "Please enter your company data.",
                     textPadding: w * 0.05,
                   ),
                   Padding(
                      padding: EdgeInsets.only(top: h * 0.26),
                     child: BackgroundVerificationCompanyWidget(
                       widgets: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,

                         children: [
                           SizedBox(
                             height: h*0.01,
                           ),
                           Text(
                               'Enter your Company',
                             style: TextStyle(
                               fontSize: w*0.08,
                               color: primaryColor
                             ),
                           ),
                           Text(
                             'Location',
                             style: TextStyle(
                                 fontSize: w*0.08,
                                 color: primaryColor
                             ),
                           ),

                           Icon(Icons.keyboard_arrow_down_sharp,size: h*0.07,color: primaryColor,),
                           InkWell(
                             onTap: (){
                               AutoRouter.of(context).pushNamed('/googleMap');

                             },
                             child: Container(
                               width: w*0.7,
                               height:w*0.7 ,
                               decoration: BoxDecoration(

                                 borderRadius: BorderRadius.all(Radius.circular(25),
                                 ),
                                 border: Border.all(width: 2,color: primaryColor),
                               ),
                               child: Center(
                                 child: Image.asset(
                                   'assets/images/map.png',
                                   width: w*0.5,
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: h*0.01,
                           ),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: w*0.2),
                             child: ButtonTextWidget(
                                 padding: 0,
                                 backgroundColor: primaryColor,
                                 text: 'Accept',
                                 textColor: Colors.white,
                                 textSize: w*0.06,
                                 onPressed: (){
                                   if(CompanyInformationBloc.get(context).markerLocation!=null){
                                     AutoRouter.of(context).pushNamed('/morInfo');
                                   }else{
                                     SnackBarMessage().showSnackBar(
                                         message:'Choose your company location ',
                                         backgroundColor: Colors.redAccent,
                                         context: context);
                                   }

                                 }
                             ),
                           ),
                         ],
                       ),
                     ),
                   )

                 ],
               ),

             ),
           );
         },
    );


  }


}
