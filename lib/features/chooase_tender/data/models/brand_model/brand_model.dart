

import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';

class BrandChooseTenderModel extends BrandChooseTenderEntity{

  const BrandChooseTenderModel({
    required int idBrand,
    required int categoryId,
    required String nameEn
}):super(nameEn: nameEn,idBrand: idBrand,categoryId: categoryId);

  factory BrandChooseTenderModel.fromJson(Map<String,dynamic>json){
    final idBrand=json['idBrand'];
    final nameEn=json['nameEn'];
    final categoryId=json['categoryId'];
    return BrandChooseTenderModel(idBrand: idBrand, nameEn: nameEn,categoryId:categoryId);
  }


}