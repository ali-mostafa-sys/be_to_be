import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';
import 'package:be_to_be/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:be_to_be/features/profile/presentation/widget/button_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);
  var formKeyProfile=GlobalKey<FormState>();
  var formKeyCompany=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context)=>di.sl<ProfileBloc>()..add(GetUserDataEvent()),
      child: BlocConsumer<ProfileBloc,ProfileState>(
        listener: (context,state){
          if(state is LogoutState){
            AutoRouter.of(context).pushAndPopUntil(LoginRoute(), predicate: (route) => false);
          }
          if(state is ErrorEditUserDataState){
            SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
          }
          if(state is LoadedEditUserDataState){
            SnackBarMessage().showSnackBar(message: 'Edit Successfully', backgroundColor:primaryColor, context: context);
          }
        },
        builder: (context,state){
          var proBloc=ProfileBloc.get(context);
          if(state is LoadingGetUserDataState){
            return const LoadingWidget();
          }
          if(state is LoadingEditUserDataState){
            return const LoadingWidget();
          }
          if(state is ErrorGetUserDataState){
            return ErrorPageWidget(errorText: state.error, onTap: (){
              proBloc.add(GetUserDataEvent());
            });
          }

          return BackgroundWidget(
              widgets: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 0),
                  child: Container(
                    height: h*0.1,
                    child: Row(
                      children: [
                        Expanded(

                          child: ButtonProfiletWidget(
                              padding: h*0.02,
                              backgroundColor: proBloc.isProfile==true?
                              HexColor("#489F85"):HexColor('#9F9F9F'),
                              text: "Personal Info",
                              textSize: w*0.05,
                              onPressed: (){
                                proBloc.add(SelectedButtonEvent(isProfile:true ,isCompany:false ));
                              }),
                        ),
                        SizedBox(
                          width: w*0.01,
                        ),
                        Expanded(

                          child: ButtonProfiletWidget(
                              padding: h*0.02,
                              backgroundColor:proBloc.isCompany==true?
                              HexColor("#489F85"):HexColor('#9F9F9F'),
                              text: "Company Info",
                              textSize: w*0.05,
                              onPressed: (){
                                proBloc.add(SelectedButtonEvent(isProfile:false ,isCompany:true ));
                              }),
                        ),

                      ],
                    ),
                  ),


                ),
                proBloc.isProfile==true?
                    /// HERE FOR PROFILE
                Column(
                  children: [
                    Text('Hi there ${proBloc.name}',style: TextStyle(
                      fontSize: w*0.1,fontWeight: FontWeight.bold
                    ),),
                    TextButtonWidget(
                        text: 'Sign Out',
                        textColor: HexColor('#7C7D7E'),
                        textSize: w*0.05,
                        onTap: (){
                          proBloc.add(LogoutEvent());
                        }
                        , textDecoration: false),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: w*0.1),
                      child: Form(
                        key: formKeyProfile,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                  controller: proBloc.firstName,
                                  textInputType: TextInputType.text,
                                  obscureText: false,
                                  labelText: 'First name',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.lastName,
                                  textInputType: TextInputType.text,
                                  obscureText: false,
                                  labelText: 'Last name',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.email,
                                  textInputType: TextInputType.emailAddress,
                                  obscureText: false,
                                  labelText: ' Email',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.mobile,
                                  textInputType: TextInputType.number,
                                  obscureText: false,
                                  labelText: 'Mobile',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.birthDate,
                                  textInputType: TextInputType.none,
                                  obscureText: false,
                                  onTap: (){
                                    showDatePicker(
                                        context: context,
                                        initialDate:DateTime.parse("1990-08-27T19:00:00Z"),
                                        firstDate: DateTime.parse("1990-08-27T19:00:00Z"),
                                        lastDate: DateTime.now())
                                        .then((value) {

                                      proBloc.birthDate.text=DateFormat.yMd().format(value!,);
                                    });
                                  },
                                  labelText: 'Birth date',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.password,
                                  textInputType: TextInputType.text,
                                  obscureText: proBloc.obSecure,
                                  suffixIcon:  IconButton(
                                    onPressed: () {
                                      proBloc.add(ChangeObSecurePasswordEvent());

                                    },
                                    icon: proBloc.obSecure==false? const Icon(Icons.visibility_off_outlined):const Icon(Icons.remove_red_eye_outlined),
                                    iconSize: 30,
                                    color: HexColor('#878787'),
                                  ),
                                  labelText: 'Password',
                                  validator: (value){

                                  }),
                              SizedBox(
                                height: h*0.05,
                              ),
                              ButtonTextWidget(
                                  padding: 0,
                                  backgroundColor: primaryColor,
                                  text: "Edit Profile",
                                  textColor: Colors.white,
                                  textSize: w*0.05,
                                  onPressed: (){
                                    if(formKeyProfile.currentState!.validate()){
                                      final userDataEntity=GetUserDataEntity(
                                          firstName: proBloc.firstName.text,
                                          lastName: proBloc.lastName.text,
                                          email: proBloc.email.text,
                                        mobile: proBloc.mobile.text,
                                        birthDate: proBloc.birthDate.text,
                                        password: proBloc.password.text
                                      );
                                     // proBloc.add(EditUserDataEvent(userDataEntity: userDataEntity));
                                    }
                                  }),
                              SizedBox(
                                height: h*0.05,
                              ),

                      ],),),
                    ),
                  ],
                ):Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w*0.1),
                      child: Form(
                        key: formKeyCompany,
                          child: Column(
                        children: [
                          SizedBox(
                            height: h*0.02,
                          ),
                          TextFormFieldWidget(
                              controller: proBloc.companyName,
                              textInputType: TextInputType.text,
                              obscureText: false,
                              labelText: 'Company Name',
                              validator: (value){

                              }),
                          SizedBox(
                            height: h*0.02,
                          ),
                          /// HERE DATE
                          TextFormFieldWidget(
                              controller: proBloc.establishDate,
                              textInputType: TextInputType.none,
                              obscureText: false,
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    initialDate:DateTime.parse("2020-08-27T19:00:00Z"),
                                    firstDate: DateTime.parse("2020-08-27T19:00:00Z"),
                                    lastDate: DateTime.now())
                                    .then((value) {

                                  proBloc.establishDate.text=DateFormat.yMd().format(value!,);
                                });
                              },
                              labelText: 'Establish Date',
                              validator: (value){

                              }),
                          SizedBox(
                            height: h*0.02,
                          ),
                          TextFormFieldWidget(
                              controller: proBloc.companyType,
                              textInputType: TextInputType.text,
                              obscureText: false,
                              labelText: 'Company Type',
                              validator: (value){

                              }),
                          SizedBox(
                            height: h*0.02,
                          ),
                          TextFormFieldWidget(
                              controller: proBloc.licenseNumber,
                              textInputType: TextInputType.text,
                              obscureText: false,
                              labelText: 'License Number',
                              validator: (value){

                              }),
                          SizedBox(
                            height: h*0.02,
                          ),
                          /// HERE DATE
                          TextFormFieldWidget(
                              controller: proBloc.licenseExpireDate,
                              textInputType: TextInputType.none,
                              obscureText: false,
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    initialDate:DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse("2025-08-27T19:00:00Z"))
                                    .then((value) {

                                  proBloc.licenseExpireDate.text=DateFormat.yMd().format(value!,);
                                });
                              },
                              labelText: 'License Expire Date',
                              validator: (value){

                              }),
                          SizedBox(
                            height: h*0.05,
                          ),
                          /// here for pick image
                          Container(
                            width: double.infinity,
                            height: h * 0.2,
                            decoration: BoxDecoration(
                                color: HexColor("#DCDCDC"),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: primaryColor, width: 1)),
                            child: Center(
                              child: proBloc.licenseImage == null
                                  ? InkWell(
                                onTap: () {
                                  proBloc.add(PickImageLicenseEvent());
                                },
                                child: Text(
                                  ' License Image',
                                  style: TextStyle(
                                      color: primaryColor),
                                ),
                              )
                                  : Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(
                                    proBloc.licenseImage!,
                                    width: double.infinity,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      proBloc.add(
                                          DeleteLicenseImageEvent());
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Align(
                                      alignment:
                                      Alignment.bottomRight,
                                      child: IconButton(
                                          onPressed: () {
                                            //TODO: FOR UPLOAD IMAGE
                                            // proBloc.add(UploadImageEvent(
                                            //     imageFile: bloc
                                            //         .licenseImage!));
                                          },
                                          icon: Icon(
                                            Icons
                                                .cloud_upload_outlined,
                                            color: primaryColor,
                                          )))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h*0.05,
                          ),

                        ],
                      )),
                    )
                  ],
                ),

            ],
          ),
              ));
        },
      ),
    );
  }
}
