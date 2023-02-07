

import 'package:be_to_be/features/home/domain/entiy/setting_entity/setting_entity.dart';

class SettingModel extends SettingEntity{

  const SettingModel({
    required String nameEn,
    required String value,
}):super(nameEn: nameEn,value: value);

  factory SettingModel.fromJson(Map<String,dynamic>json){
    final nameEn=json['nameEn'];
    final value=json['value'];
    return SettingModel(nameEn: nameEn, value: value);


  }


}