import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';

class CountryModel extends CountryEntity{
  CountryModel({
    required String nameEn,
    required int countryId,
}):super(nameEn: nameEn,countryId: countryId);

  factory CountryModel.fromJson(Map<String,dynamic>json){
    final nameEn=json['nameEn'];
    final countryId=json['idCountry'];
    return CountryModel(nameEn: nameEn, countryId: countryId);
  }

}