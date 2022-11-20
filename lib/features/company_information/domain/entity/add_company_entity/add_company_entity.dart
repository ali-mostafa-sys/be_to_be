
import 'package:equatable/equatable.dart';

class AddCompanyEntity extends Equatable{

  final String nameEn;
  final int companyTypeId;
  final String licenseNumber;
  final String establishAt;
  final String licenseImgUrl;
  final int cityId;
  final String area;
  final String street;
  final String buildingNumber;
  final String addressLongitude;
  final String addressLatitude;
  final String moreAddressInfo;
  final String licenseExpirAt;

  const AddCompanyEntity({
    required this.nameEn,
    required this.companyTypeId,
    required this.licenseNumber,
    required this.establishAt,
    required this.licenseImgUrl,
    required this.cityId,
    required this.area,
    required this.street,
    required this.buildingNumber,
    required this.addressLatitude,
    required this.addressLongitude,
    required this.moreAddressInfo,
    required this.licenseExpirAt,
});

  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,companyTypeId,licenseNumber,establishAt,
    licenseImgUrl,cityId,area,street,buildingNumber,addressLatitude,addressLongitude,moreAddressInfo,licenseExpirAt];

}