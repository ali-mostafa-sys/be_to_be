

import 'package:be_to_be/features/add_tender/domain/entity/city_add_tender_entity/city_add_tender_entity.dart';

class CityAddTenderModel extends CityAddTenderEntity{

  const CityAddTenderModel({
    required String nameEn,
    required int idCity,
}):super(nameEn: nameEn,idCity: idCity);

  factory CityAddTenderModel.fromJson(Map<String,dynamic>json){
    final nameEn=json['nameEn'];
    final idCity=json['idCity'];
    return CityAddTenderModel(nameEn: nameEn, idCity: idCity);
  }



}