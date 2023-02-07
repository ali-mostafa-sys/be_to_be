part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}
///
/// here for selected profile/company button state
///
class SelectedButtonState extends ProfileState{
  final bool isProfile;
  final bool isCompany;
  const SelectedButtonState({
    required this.isProfile,
    required this.isCompany
  });
  @override
  List<Object> get props => [isProfile,isCompany];


}
///
/// here for get user data event
///

class LoadingGetUserDataState extends ProfileState{}
class LoadedGetUserDataState extends ProfileState{}
class ErrorGetUserDataState extends ProfileState{
  final String error;
  const ErrorGetUserDataState({required this.error});
  @override
  List<Object> get props => [error,];
}
///
/// here for password
///

class ChangeObSecurePasswordState extends ProfileState{
  final bool obSecure;
  const ChangeObSecurePasswordState({required this.obSecure});
  @override
  List<Object> get props => [obSecure];
}
///
/// logOut event
///
class LogoutState extends ProfileState{}

/// here for pick license image ///////////////////////////

class PickImageForLicenseState extends ProfileState{}
class ErrorPickImageForLicenseState extends ProfileState{}
class DeleteLicenseImageState extends ProfileState{}
///
/// here for edit user data state
///
class LoadingEditUserDataState extends ProfileState{}
class LoadedEditUserDataState extends ProfileState{}
class ErrorEditUserDataState extends ProfileState{
  final String error;
  const ErrorEditUserDataState({required this.error});
  @override
  List<Object> get props => [error,];
}
///
/// here for upload image state
///
class LoadingUploadProfileImageState extends ProfileState{}
class LoadedUploadProfileImageState extends ProfileState{}
class ErrorUploadProfileImageState extends ProfileState{
  final String error;
  const ErrorUploadProfileImageState({required this.error});
  @override
  List<Object> get props => [error];
}





