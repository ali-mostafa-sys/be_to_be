

import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';

class CategoriesChooseTenderModel extends CategoriesChooseTenderEntity{

  const CategoriesChooseTenderModel({
    required int idCategory,
    required String nameEn,
}):super(nameEn: nameEn,idCategory: idCategory);
  factory CategoriesChooseTenderModel.fromJson(Map<String,dynamic>json){
    final idCategory=json['idCategory'];
    final nameEn=json['nameEn'];
    return CategoriesChooseTenderModel(idCategory: idCategory, nameEn: nameEn);
  }


}