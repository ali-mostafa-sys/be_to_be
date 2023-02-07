import 'dart:async';
import 'dart:io';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/get_user_dat_usecase.dart';
import 'package:be_to_be/features/profile/domain/usecase/get_user_data_usecase/post_edit_user_data_usecase.dart';
import 'package:be_to_be/features/profile/domain/usecase/upload_profile_image_usecase/uploade_profile_image_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static ProfileBloc get(context)=>BlocProvider.of(context);
  final GetUserDataUseCase getUserDataUseCase;
  final PostEditUserDataUseCase editUserDataUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;
  final SharedPreferences sharedPreferences;

  /// here for text form fields

  final TextEditingController firstName=TextEditingController();
  final TextEditingController lastName=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController mobile=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController birthDate=TextEditingController();
  String birth='';
  /// here for company fields
 int companyId=0;
  final TextEditingController companyName=TextEditingController();
  final TextEditingController establishDate=TextEditingController();
  String establish='';
  final TextEditingController companyType=TextEditingController();
  final TextEditingController licenseNumber=TextEditingController();
  final TextEditingController licenseExpireDate=TextEditingController();
  String expire='';
 // String? imageUrl;





String?name;

  bool isProfile=true;
  bool isCompany=false;
  bool obSecure=true;
   GetUserDataEntity? userDataEntity;


  // here for pick license image
  File? licenseImage;
  ImagePicker pickedLicenseImage = ImagePicker();
  String? imageUrl;

  Future getLicenseImage() async {
    final imagePicked =
    await pickedLicenseImage.pickImage(source: ImageSource.gallery);
    if (imagePicked == null) return;

    if (imagePicked != null) {
      File imageTemporary = File(imagePicked.path);
      licenseImage = imageTemporary;
      emit(PickImageForLicenseState());

      print('Success');
    } else {
      print('Error');
      emit(ErrorPickImageForLicenseState());
    }
  }






  ProfileBloc({
    required this.getUserDataUseCase,
    required this.editUserDataUseCase,
    required this.sharedPreferences,
    required this.uploadProfileImageUseCase,

}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit)async {
      ///
      /// here for password
      ///
      if(event is ChangeObSecurePasswordEvent){
        obSecure= !obSecure;
        emit(ChangeObSecurePasswordState(obSecure: obSecure));
      }

      ///
      /// here for selected profile/company button event
      ///
      if(event is SelectedButtonEvent){
        isProfile=event.isProfile;
        isCompany=event.isCompany;
        emit(SelectedButtonState(isProfile:event. isProfile, isCompany:event. isCompany));

      }
      ///
      /// here for get user data event
      ///
      if(event is GetUserDataEvent){

        emit(LoadingGetUserDataState());

        final failureOrGetUserData=await getUserDataUseCase();
        failureOrGetUserData.fold(
                (failure) {
                  emit(ErrorGetUserDataState(error: _mapFailureToMessage(failure)));
                },
                (userData) {
                  name=userData.firstName;
                  firstName.text=userData.firstName;
                  lastName.text=userData.lastName;
                  email.text=userData.email;
                  mobile.text=userData.mobile??'';
                  password.text=userData.password??'';
                  final birth=DateTime.parse(userData.birthDate!);
                  final birthDay=DateFormat.yMd().format(birth);
                  /// here for edit after backend fill this field
                  birthDate.text=birthDay??'';
                  /// here for company info
                  companyName.text=userData.companyName??"";
                  final est=DateTime.parse(userData.establishDate!);
                  final establish=DateFormat.yMd().format(est);
                  //DateFormat.yMd().format(userData.establishDate);
                  establishDate.text=establish??"";
                  companyType.text=userData.companyType??"";
                  licenseNumber.text=userData.licenseNumber??"";
                  final exp=DateTime.parse(userData.licenseExpireDate!);
                  final expire=DateFormat.yMd().format(exp);
                  licenseExpireDate.text=expire??"";
                  imageUrl=userData.imgUrl;
                  companyId=userData.companyId;
                  userDataEntity=GetUserDataEntity(
                      firstName:userData. firstName,
                      lastName:userData. lastName,
                      email:userData. email,
                    mobile: userData.mobile,
                    password: userData.password,
                    birthDate: userData.birthDate,
                    companyId: userData.companyId,
                  );
                  print(userDataEntity);
                  emit(LoadedGetUserDataState());
            });

      }
      ///
      /// here for logout event
      ///
        if(event is LogoutEvent){
          await sharedPreferences.remove('cookies');
          await sharedPreferences.remove('userId');
        //  await sharedPreferences.clear();
          emit(LogoutState());
        }
      ///
      /// here for pick license image ////////////////////////
      ///
      if(event is PickImageLicenseEvent){
        await getLicenseImage();
      }
      ///
      /// here for delete the picked image from gallery///////
      ///
      if(event is DeleteLicenseImageEvent ){
        licenseImage=null;
        imageUrl=null;
        emit(DeleteLicenseImageState());

      }
      ///
      /// here for upload image for license /////
      ///

      if(event is UploadProfileImageEvent){
        emit(LoadingUploadProfileImageState());
        final failureOrUploaded=await uploadProfileImageUseCase(event.imageFile);
        failureOrUploaded.fold(
                (failure) {
              emit(ErrorUploadProfileImageState(error: _mapFailureToMessage(failure)));
            },
                (uploaded) {
              imageUrl=uploaded.imageUrl;
              // licenseImage=null;
              print(uploaded.imageUrl);
              emit(LoadedUploadProfileImageState());

            });
      }






      ///
      /// here for edit user data event
      ///
      if(event is EditUserDataEvent){

        final failureOrDataEdited=await editUserDataUseCase(event.userDataEntity);

        failureOrDataEdited.fold(
                (failure) {
                  emit(ErrorEditUserDataState(error: _mapFailureToMessage(failure)));
            },
                (dataEdited) {
                  emit(LoadedEditUserDataState());
            });


      }











    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
