import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/core/widgets/up_page_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_verification_company_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:be_to_be/features/company_information/presentation/widgets/show_tender_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MoreAddressInfoPage extends StatelessWidget {
   MoreAddressInfoPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _buildBody(h:h,w:w),
    );
  }
  Widget _buildBody({
  required double h,
  required double w,
}){
    return BlocConsumer<CompanyInformationBloc,CompanyInformationState>(
         listener: (context,state){
           print(state);
           // if (state is OnAcceptButtonState) {
           //   showDialog(
           //       context: context,
           //       builder: (BuildContext context) {
           //         return ShowTenderDialogWidget();
           //       });
           // }
           if(state is ErrorAddCompanyState){
             SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
           }
           if(state is LoadedAddCompanyState){
            // isPop = true;
             SnackBarMessage().showSnackBar(message: 'Added successfully', backgroundColor: primaryColor, context: context);
             AutoRouter.of(context).pushNamed('/refresh');

           }
         },
         builder: (context,state){
           var bloc = CompanyInformationBloc.get(context);
           if(state is LoadingAddCompanyState){
             return const  LoadingWidget();

           }
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
                       widgets: SingleChildScrollView(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,

                           children: [
                             SizedBox(
                               height: h*0.04,
                             ),
                             Padding(
                               padding:  EdgeInsetsDirectional.only(
                                 start: w*0.1,
                                 end: w*0.1,
                               )
                               ,
                               child: Form(
                                 key: formKey,
                                   child: Column(
                                     children: [

                                       TextFormFieldWidget(
                                           controller: bloc.street,
                                           textInputType: TextInputType.text,
                                           obscureText: false,
                                           labelText: 'Street',
                                           suffixIcon:const  Icon(Icons.location_on_outlined),
                                           validator: (value){
                                             if(value!.isEmpty){
                                               return 'Street shouldn\'t be empty ';
                                             }else{
                                               return null;
                                             }

                                           }),
                                       SizedBox(
                                         height: h*0.04,
                                       ),
                                       TextFormFieldWidget(
                                           controller: bloc.area,
                                           textInputType: TextInputType.text,
                                           obscureText: false,
                                           labelText: 'Area',
                                           suffixIcon:const  Icon(Icons.location_on_outlined),
                                           validator: (value){
                                             if(value!.isEmpty){
                                               return 'Area shouldn\'t be empty ';
                                             }else{
                                               return null;
                                             }

                                           }),
                                       SizedBox(
                                         height: h*0.04,
                                       ),
                                       TextFormFieldWidget(
                                           controller: bloc.buildingNumber,
                                           textInputType: TextInputType.number,
                                           obscureText: false,
                                           suffixIcon:const  Icon(Icons.location_on_outlined),
                                           labelText: 'Building Number',
                                           validator: (value){
                                             if(value!.isEmpty){
                                               return 'Building Number shouldn\'t be empty ';
                                             }else{
                                               return null;
                                             }

                                           }),
                                       SizedBox(
                                         height: h*0.04,
                                       ),
                                       TextFormFieldWidget(
                                           controller: bloc.moreAddressInfo,
                                           textInputType: TextInputType.text,
                                           obscureText: false,
                                           suffixIcon:const  Icon(Icons.location_on_outlined),
                                           labelText: 'More Address Information',
                                           validator: (value){
                                             if(value!.isEmpty){
                                               return 'Address Information shouldn\'t be empty ';
                                             }else{
                                               return null;
                                             }

                                           }),





                                       SizedBox(
                                         height: h*0.04,
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
                                               if(formKey.currentState!.validate()){
                                                 final addCompanyEntity =AddCompanyEntity(
                                                     nameEn: bloc.companyName.text.toString(),
                                                     companyTypeId: bloc.selectedCompanyId!,
                                                     licenseNumber: bloc.licenseNumber.text.toString(),
                                                     establishAt: bloc.establishDate.text.toString(),
                                                     licenseImgUrl: bloc.imageUrl.toString(),
                                                     cityId: bloc.selectedCityId!,
                                                     area: bloc.area.text.toString(),
                                                     street: bloc.street.text.toString(),
                                                     buildingNumber: bloc.buildingNumber.text.toString(),
                                                     addressLatitude: bloc.markerLocation!.latitude.toString(),
                                                     addressLongitude: bloc.markerLocation!.longitude.toString(),
                                                     moreAddressInfo: bloc.moreAddressInfo.text.toString(),
                                                     licenseExpirAt: bloc.licenseExpireDate.text.toString()
                                                 );
                                                 bloc.add(AddCompanyEvent(addCompanyEntity: addCompanyEntity));




                                               //  bloc.add(OnAcceptButtonEvent());
                                              }

                                             }
                                         ),
                                       ),

                                     ],
                                   ),),
                             ),


                           ],
                         ),
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
