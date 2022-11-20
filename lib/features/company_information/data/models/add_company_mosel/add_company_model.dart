import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';

class AddCompanyModel extends AddCompanyEntity{


  const AddCompanyModel({
    required String nameEn,
    required int companyTypeId,
    required String licenseNumber,
    required String establishAt,
    required String licenseImgUrl,
    required int cityId,
    required String area,
    required String street,
    required String buildingNumber,
    required String addressLongitude,
    required String addressLatitude,
    required String moreAddressInfo,
    required String licenseExpirAt,
}):super(
    nameEn: nameEn,
    companyTypeId: companyTypeId,
    licenseNumber: licenseNumber,
    establishAt: establishAt,
    licenseImgUrl: licenseImgUrl,
    cityId: cityId,
    area: area,
    street: street,
    buildingNumber: buildingNumber,
    addressLatitude: addressLatitude,
    addressLongitude: addressLongitude,
    moreAddressInfo: moreAddressInfo,
    licenseExpirAt: licenseExpirAt
  );

  Map<String,dynamic>toJson(){
    return {
      "nameEn":nameEn,
      "companyTypeId":companyTypeId.toString(),
      "licenseNumber":licenseNumber,
      "establishAt":establishAt,
      "licenseImgUrl":licenseImgUrl,
      "cityId":cityId.toString(),
      "area":area,
      "street":street,
      "buildingNumber":buildingNumber,
      "addressLatitude":addressLatitude,
      "addressLongitude":addressLongitude,
      "moreAddressInfo":moreAddressInfo,
      "licenseExpirAt":licenseExpirAt,
    };
}

}