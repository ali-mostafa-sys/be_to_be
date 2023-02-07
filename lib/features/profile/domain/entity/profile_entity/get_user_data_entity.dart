

import 'package:equatable/equatable.dart';

class GetUserDataEntity extends Equatable{

  final String firstName;
  final String lastName;
  final String email;
  final String? mobile;
  final String? password;
  final String? birthDate;
  /// here for company info
  final String? companyName;
  final int companyId;
  final String? establishDate;
  final String? companyType;
  final String? licenseNumber;
  final String? licenseExpireDate;
  final String? imgUrl;


  const GetUserDataEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.mobile,
    this.password,
    this.birthDate,
    /// here for company info
    this.companyName,
    required this.companyId,
    this.establishDate,
    this.companyType,
    this.licenseNumber,
    this.licenseExpireDate,
    this.imgUrl,
});





  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,mobile,password,birthDate,companyName,establishDate,companyType,companyId,licenseNumber,licenseExpireDate,imgUrl];

}