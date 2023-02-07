part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}
///
/// here for selected profile/company button event
///
class SelectedButtonEvent extends ProfileEvent{
  final bool isProfile;
  final bool isCompany;
  const SelectedButtonEvent({
    required this.isProfile,
    required this.isCompany
});
  @override
  List<Object> get props => [isProfile,isCompany];
}

///
/// here for get user data event
///

class GetUserDataEvent extends ProfileEvent{


}
///
/// here for password
///
class ChangeObSecurePasswordEvent extends ProfileEvent{

}
///
/// logOut event
///
class LogoutEvent extends ProfileEvent{}

/// here for pick license image ///////////////////////////

class PickImageLicenseEvent extends ProfileEvent{}
class DeleteLicenseImageEvent extends ProfileEvent{}
///
/// here for edit user data event
///
class EditUserDataEvent extends ProfileEvent{
  final GetUserDataEntity userDataEntity;
  const EditUserDataEvent({required this.userDataEntity});
  @override
  List<Object> get props => [userDataEntity];

}

///
/// here for upload profile image event
///
class UploadProfileImageEvent extends ProfileEvent{
  final File imageFile;
  const UploadProfileImageEvent({
    required this.imageFile
  });
  @override
  List<Object> get props => [imageFile];
}











