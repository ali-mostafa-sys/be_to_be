


import 'package:be_to_be/features/add_tender/domain/entity/get_country_entity/get_country_entity.dart';

class CountriesModel extends CountriesEntity{


  const CountriesModel({
    required String nameEn,
    required int idCountry,


}):super(nameEn: nameEn,idCountry: idCountry);

  factory CountriesModel.fromJson(Map<String,dynamic>json){
    final nameEn=json['nameEn'];
    final idCountry=json['idCountry'];
    return CountriesModel(nameEn: nameEn, idCountry: idCountry);
  }

}