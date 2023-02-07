


import 'package:be_to_be/features/terms/domain/entity/terms_entity.dart';

class TermsModel extends TermsEntity{
  TermsModel({required String contentEn}) : super(contentEn: contentEn);


  factory TermsModel.fromJson(Map<String,dynamic>json){
    final contentEn=json['contentEn'];
    return TermsModel(contentEn: contentEn);

  }

}