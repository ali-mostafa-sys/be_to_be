import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';

class BeToBeModel extends BeToBeEntity {
  BeToBeModel({required int idTender,
    required int tenderQuantity,
    required String name,
    required String status,
    required String productName,
    required String brandName,
    required String closedAt,
    required String categoryName,
    required String? productImgUrl,
    required String? area,
    required String? street,
    required String? supplierLocation})
      : super(
      idTender: idTender,
      tenderQuantity: tenderQuantity,
      name: name,
      status: status,
      productName: productName,
      brandName: brandName,
      closedAt: closedAt,
      categoryName: categoryName,
      productImgUrl: productImgUrl,
      area: area,
      street: street,
      supplierLocation: supplierLocation);

  factory BeToBeModel.fromJson(Map<String, dynamic>json){
    final idTender = json['idTender'];
    final tenderQuantity = json['tenderQuantity'];
    final name = json['name'];
    final status = json['status'];
    final productName = json['productName'];
    final brandName = json['brandName'];
    final closedAt = json['closedAt'];
    final categoryName = json['categoryName'];
    final productImgUrl = json['productImgUrl'];
    final area = json['area'];
    final street = json['street'];
    final supplierLocation = json['supplierLocation'];
    return BeToBeModel(idTender: idTender,
        tenderQuantity: tenderQuantity,
        name: name,
        status: status,
        productName: productName,
        brandName: brandName,
        closedAt: closedAt,
        categoryName: categoryName,
        productImgUrl: productImgUrl,
        area: area,
        street: street,
        supplierLocation: supplierLocation);
  }
}
