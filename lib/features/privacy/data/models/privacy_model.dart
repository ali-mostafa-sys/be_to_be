

import 'package:be_to_be/features/privacy/domain/entity/privacy_entity.dart';

class PrivacyModel extends PrivacyEntity{
  PrivacyModel({required String contentEn}) : super(contentEn: contentEn);


  factory PrivacyModel.fromJson(Map<String,dynamic>json){
    final contentEn=json['contentEn'];
    return PrivacyModel(contentEn: contentEn);

  }

}