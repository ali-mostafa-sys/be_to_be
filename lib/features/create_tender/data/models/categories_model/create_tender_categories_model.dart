

import 'package:be_to_be/features/create_tender/domain/entity/category_entity/category_create_tender_entity.dart';

class CategoriesCreateTenderModel extends CategoriesCreateTenderEntity{

  const CategoriesCreateTenderModel({
    required int idCategory,
    required String nameEn,
  }):super(nameEn: nameEn,idCategory: idCategory);
  factory CategoriesCreateTenderModel.fromJson(Map<String,dynamic>json){
    final idCategory=json['idCategory'];
    final nameEn=json['nameEn'];
    return CategoriesCreateTenderModel(idCategory: idCategory, nameEn: nameEn);
  }


}