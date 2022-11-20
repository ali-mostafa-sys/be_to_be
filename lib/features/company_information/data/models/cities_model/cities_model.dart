
import 'package:be_to_be/features/company_information/domain/entity/city_entity/city_entity.dart';

class CitiesModel extends CityEntity{
 const CitiesModel({
    required String nameEn,
    required int cityId,
}):super(nameEn: nameEn,cityId: cityId);

 factory  CitiesModel.fromJson(Map<String,dynamic>json){
   final nameEn=json['nameEn'];
   final cityId=json['idCity'];
   return CitiesModel(nameEn: nameEn, cityId: cityId);
 }

}