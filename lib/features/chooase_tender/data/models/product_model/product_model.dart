


import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';

class ProductChooseTenderModel extends ProductChooseTenderEntity{

  const ProductChooseTenderModel({
    required int idProduct,
    required int brandId,
    required String nameEn
  }):super(nameEn: nameEn,idProduct:idProduct,brandId: brandId );

  factory ProductChooseTenderModel.fromJson(Map<String,dynamic>json){
    final idProduct=json['idProduct'];
    final nameEn=json['nameEn'];
    final brandId=json['brandId'];
    return ProductChooseTenderModel(idProduct: idProduct, nameEn: nameEn,brandId: brandId);

  }


}