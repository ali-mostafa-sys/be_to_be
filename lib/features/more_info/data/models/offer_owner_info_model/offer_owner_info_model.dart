import 'package:be_to_be/features/more_info/domain/entity/offer_owner_info_entity/offer_owner_info_entity.dart';

class OfferOwnerInfoModel extends OfferOwnerInfoEntity {
  OfferOwnerInfoModel({required String companyCityName,
    required String companyCountryName,
    required String mobile,
    required String? companyName,
    required String companyArea,
    required String companyStreet,
    required int hasMobileWhatsapp})
      : super(
      companyCityName: companyCityName,
      companyCountryName: companyCountryName,
      mobile: mobile,
      companyName: companyName,
      companyArea: companyArea,
      companyStreet: companyStreet,
      hasMobileWhatsapp: hasMobileWhatsapp);

  factory OfferOwnerInfoModel.fromJson(Map<String, dynamic>json){
    final companyCityName = json['companyCityName'];
    final companyCountryName = json['companyCountryName'];
    final mobile = json['mobile'];
    final companyName = json['companyName'];
    final companyArea = json['companyArea'];
    final companyStreet = json['companyStreet'];
    final hasMobileWhatsapp = json['hasMobileWhatsapp'];

    return OfferOwnerInfoModel(companyCityName: companyCityName,
        companyCountryName: companyCountryName,
        mobile: mobile,
        companyName: companyName,
        companyArea: companyArea,
        companyStreet: companyStreet,
        hasMobileWhatsapp: hasMobileWhatsapp);


  }
}
