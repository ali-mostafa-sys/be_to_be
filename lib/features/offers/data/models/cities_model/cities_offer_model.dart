

import 'package:be_to_be/features/offers/domain/entity/cities_entity/cities_offer_entity.dart';

class CitiesOfferModel extends CitiesOfferEntity{

  const CitiesOfferModel({
    required String nameEn,
    required int idCity,
}):super(nameEn: nameEn,idCity: idCity);

  factory CitiesOfferModel.fromJson(Map<String,dynamic>json){
    final nameEn=json['nameEn'];
    final idCity=json['idCity'];
    return CitiesOfferModel(nameEn: nameEn, idCity: idCity);
  }



}