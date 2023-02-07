


import 'package:be_to_be/features/add_tender/domain/entity/product_entity/product_entity.dart';

class ProductModel extends ProductEntity{


  const ProductModel({
    required String nameEn,
    required int idProduct,
}):super(nameEn: nameEn,idProduct: idProduct);

  factory ProductModel.fromJson(Map<String,dynamic>json){

    final nameEn=json['nameEn'];
    final idProduct=json['idProduct'];
    return ProductModel(nameEn: nameEn, idProduct: idProduct);
  }

}