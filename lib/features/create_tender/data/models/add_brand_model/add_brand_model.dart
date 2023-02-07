

import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';

class AddBrandModel extends AddBrandEntity{
  const AddBrandModel({
    required String nameEn,
    required String descriptionEn,
    required int categoryId,
}):super(nameEn: nameEn,descriptionEn: descriptionEn,categoryId: categoryId);
  Map<String,dynamic>toJson(){
    return {
      "nameEn":nameEn.toString(),
      "descriptionEn":descriptionEn.toString(),
      "categoryId":categoryId.toString(),
    };
  }
}