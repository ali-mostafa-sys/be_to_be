





import 'package:be_to_be/features/create_tender/domain/entity/brand_entity/brand_create_tender_entity.dart';

class BrandCreateTenderModel extends BrandCreateTenderEntity{

  const BrandCreateTenderModel({
    required int idBrand,
    required int categoryId,
    required String nameEn
  }):super(nameEn: nameEn,idBrand: idBrand,categoryId: categoryId);

  factory BrandCreateTenderModel.fromJson(Map<String,dynamic>json){
    final idBrand=json['idBrand'];
    final categoryId=json['categoryId'];
    final nameEn=json['nameEn'];
    return BrandCreateTenderModel(idBrand: idBrand, nameEn: nameEn,categoryId: categoryId);
  }


}





