import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/strings/const.dart';
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
          print(state);
          if(state is LogoutState){
            AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route) => false);
          }
          if(state is ErrorEditUserDataState){
            SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
          }
          if(state is LoadedEditUserDataState){
            SnackBarMessage().showSnackBar(message: 'Edit Successfully', backgroundColor:primaryColor, context: context);
            Future.delayed(Duration(seconds: 1)).then((value){
              AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route) => false);
            });

          }
          if(state is LoadedUploadProfileImageState){
            SnackBarMessage().showSnackBar(message: 'Uploaded Successfully', backgroundColor:primaryColor, context: context);
          }
          if(state is ErrorUploadProfileImageState){
            SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
          }
        },
        builder: (context,state){
          var proBloc=ProfileBloc.get(context);
          if (state is ErrorUploadProfileImageState) {
            return ErrorPageWidget(
                errorText: state.error,
                onTap: () {
                  proBloc.add(UploadProfileImageEvent(imageFile: proBloc.licenseImage!));
                });
          }
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
                              /// here for firstName
                              TextFormFieldWidget(
                                  controller: proBloc.firstName,
                                  textInputType: TextInputType.text,
                                  obscureText: false,
                                  labelText: 'First name',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'First name shouldn\'t be empty';
                                    }else {
                                      return null;
                                    }


                                  }),
                              /// here for lastName
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.lastName,
                                  textInputType: TextInputType.text,
                                  obscureText: false,
                                  labelText: 'Last name',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Last name shouldn\'t be empty';
                                    }else {
                                      return null;
                                    }

                                  }),
                              /// here for email
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.email,
                                  textInputType: TextInputType.emailAddress,
                                  obscureText: false,
                                  labelText: ' Email',
                                  validator: (value){
                                    if (!RegExp(validationEmail).hasMatch(value!)) {
                                      return 'Pleas insert a correct Email';
                                    } else if (value.isEmpty) {
                                      return 'Email shouldn\'t not be empty';
                                    } else {
                                      return null;
                                    }

                                  }),
                              /// here for mobile
                              SizedBox(
                                height: h*0.02,
                              ),
                              TextFormFieldWidget(
                                  controller: proBloc.mobile,
                                  textInputType: TextInputType.number,
                                  obscureText: false,
                                  labelText: 'Mobile',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Mobile shouldn\'t be empty';
                                    }else {
                                      return null;
                                    }

                                  }),
                              /// here for birthDate
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
                                          proBloc.birth=value.toString();

                                      proBloc.birthDate.text=DateFormat.yMd().format(value!,);
                                    });
                                  },
                                  labelText: 'Birth date',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Birth date shouldn\'t be empty';
                                    }else {
                                      return null;
                                    }

                                  }),
                              /// here for password
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
                                    if(value!.isEmpty){
                                      return null;
                                    }else
                                    if (value.length < 8) {
                                      return 'Password must be more than 8 characters';
                                    } else if (value.length > 20) {
                                      return 'Password should not be more than 20 characters ';
                                    } else {
                                      return null;
                                    }

                                  }),
                              /// here for button
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
                                      if(proBloc.companyName.text.isEmpty==false){
                                        if(proBloc.establishDate.text.isEmpty==false){
                                          if(proBloc.companyType.text.isEmpty==false){
                                            if(proBloc.licenseNumber.text.isEmpty==false){
                                              if(proBloc.licenseExpireDate.text.isEmpty==false){
                                                if(proBloc.imageUrl!=null){
                                                  final userDataEntity=GetUserDataEntity(
                                                    firstName: proBloc.firstName.text,
                                                    lastName: proBloc.lastName.text,
                                                    email: proBloc.email.text,
                                                    mobile: proBloc.mobile.text,
                                                    birthDate: proBloc.birth,
                                                    password: proBloc.password.text.isEmpty==true?null:proBloc.password.text,
                                                    companyName: proBloc.companyName.text,
                                                    establishDate: proBloc.establish,
                                                    companyType: proBloc.companyType.text,
                                                    licenseNumber: proBloc.licenseNumber.text,
                                                    licenseExpireDate: proBloc.expire,
                                                    imgUrl: proBloc.imageUrl,
                                                    companyId: proBloc.companyId,
                                                  );
                                                  proBloc.add(EditUserDataEvent(userDataEntity: userDataEntity));
                                                }else{
                                                  return SnackBarMessage().showSnackBar(
                                                      message: 'Please upload your license image',
                                                      backgroundColor:Colors.redAccent,
                                                      context: context);
                                                }

                                              }else{
                                                return SnackBarMessage().showSnackBar(
                                                    message: 'License expire date shoudn\'t be empty',
                                                    backgroundColor:Colors.redAccent,
                                                    context: context);
                                              }

                                            }else{ return SnackBarMessage().showSnackBar(
                                                message: 'License number shoudn\'t be empty',
                                                backgroundColor:Colors.redAccent,
                                                context: context);}

                                          }else{
                                            return SnackBarMessage().showSnackBar(
                                                message: 'Company type shoudn\'t be empty',
                                                backgroundColor:Colors.redAccent,
                                                context: context);
                                          }




                                        }else{
                                          return SnackBarMessage().showSnackBar(
                                              message: 'Establish date shoudn\'t be empty',
                                              backgroundColor:Colors.redAccent,
                                              context: context);

                                        }


                                      }else{
                                        return SnackBarMessage().showSnackBar(
                                            message: 'Company name shoudn\'t be empty',
                                            backgroundColor:Colors.redAccent,
                                            context: context);
                                      }




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
                                if(value!.isEmpty){
                                  return 'Company Name shouldn\'t be empty';
                                }else {
                                  return null;
                                }

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
                                      proBloc.establish=value.toString();

                                  proBloc.establishDate.text=DateFormat.yMd().format(value!,);
                                });
                              },
                              labelText: 'Establish Date',
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Establish Date shouldn\'t be empty';
                                }else {
                                  return null;
                                }

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
                                if(value!.isEmpty){
                                  return 'Company Type shouldn\'t be empty';
                                }else {
                                  return null;
                                }

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
                                if(value!.isEmpty){
                                  return 'License Number shouldn\'t be empty';
                                }else {
                                  return null;
                                }

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
                                      proBloc.expire=value.toString();

                                  proBloc.licenseExpireDate.text=DateFormat.yMd().format(value!,);
                                });
                              },
                              labelText: 'License Expire Date',
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'License Expire Date shouldn\'t be empty';
                                }else {
                                  return null;
                                }

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
                              child: proBloc.licenseImage == null && proBloc.imageUrl==null
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
                                  proBloc.licenseImage!=null ?
                                  Image.file(
                                    proBloc.licenseImage!,
                                    width: double.infinity,
                                  ):Container(),

                                  proBloc.imageUrl!=null&&proBloc.licenseImage==null ?
                                  Image.network('${proBloc.imageUrl}'):Container(),
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
                                            proBloc.add(UploadProfileImageEvent(
                                                imageFile: proBloc
                                                    .licenseImage!));
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
