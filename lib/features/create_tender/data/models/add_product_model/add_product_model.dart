


import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';

class AddProductModel extends AddProductEntity{

  const AddProductModel({
    required String nameEn,
    required String descriptionEn,
    required String imgUrl,
    required int brandId,
}):super(nameEn: nameEn,descriptionEn: descriptionEn,imgUrl: imgUrl,brandId: brandId);

  Map<String,dynamic>toJson(){
    return {
      "nameEn":nameEn,
      "descriptionEn":descriptionEn,
      "imgUrl":imgUrl,
      "brandId":brandId.toString()

    };
  }



}