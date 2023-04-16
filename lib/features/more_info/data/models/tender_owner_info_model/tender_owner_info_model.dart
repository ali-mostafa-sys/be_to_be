import 'package:be_to_be/features/more_info/domain/entity/tender_owner_info_entity/tender_owner_info_entity.dart';

class TenderOwnerInfoModel extends TenderOwnerInfoEntity {
  TenderOwnerInfoModel({required String tenderCityName,
    required String tenderCountryName,
    required String tenderArea,
    required String tenderStreet,
    required String tenderBuildingNo,
    required String tenderSupplierLocation,
    required String mobile,
    required String? companyName,
    required String companyCityName,
    required String companyCountryName,
    required String companyArea,
    required String companyStreet,
    required String companyBuildingNumber,
    required int hasMobileWhatsapp})
      : super(
      tenderCityName: tenderCityName,
      tenderCountryName: tenderCountryName,
      companyName: companyName,
      tenderArea: tenderArea,
      tenderStreet: tenderStreet,
      tenderBuildingNo: tenderBuildingNo,
      tenderSupplierLocation: tenderSupplierLocation,
      mobile: mobile,
      companyCityName: companyCityName,
      companyCountryName: companyCountryName,
      companyArea: companyArea,
      companyStreet: companyStreet,
      companyBuildingNumber: companyBuildingNumber,
      hasMobileWhatsapp: hasMobileWhatsapp);


  factory TenderOwnerInfoModel.fromJson(Map<String, dynamic>json){
    final tenderCityName = json['tenderCityName'];
    final tenderCountryName = json['tenderCountryName'];
    final tenderArea = json['tenderArea'];
    final tenderStreet = json['tenderStreet'];
    final tenderBuildingNo = json['tenderBuildingNo'];
    final tenderSupplierLocation = json['tenderSupplierLocation'];
    final mobile = json['mobile'];
    final companyCityName = json['companyCityName'];
    final companyCountryName = json['companyCountryName'];
    final companyArea = json['companyArea'];
    final companyStreet = json['companyStreet'];
    final companyName = json['companyName'];
    final companyBuildingNumber = json['companyBuildingNumber'];
    final hasMobileWhatsapp = json['hasMobileWhatsapp'];
    return TenderOwnerInfoModel(tenderCityName: tenderCityName,
        tenderCountryName: tenderCountryName,
        tenderArea: tenderArea,
        companyName: companyName,
        tenderStreet: tenderStreet,
        tenderBuildingNo: tenderBuildingNo,
        tenderSupplierLocation: tenderSupplierLocation,
        mobile: mobile,
        companyCityName: companyCityName,
        companyCountryName: companyCountryName,
        companyArea: companyArea,
        companyStreet: companyStreet,
        companyBuildingNumber: companyBuildingNumber,
        hasMobileWhatsapp: hasMobileWhatsapp);

  }
}
