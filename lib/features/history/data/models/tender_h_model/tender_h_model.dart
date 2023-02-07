import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';

class TenderHModel extends TenderHEntity {
  const TenderHModel(
      {required String status,
      required String name,
      required String productName,
      required String? productImgUrl,
      required String brandName,
      required String categoryName,
      required int quantity,
      required String area,
      required String street,
      required String buildingNumber,
      required String moreAddressInfo,
      required String supplierLocation,
      required String payMethod,
      required String? closedAt})
      : super(
            status: status,
            name: name,
            productName: productName,
            productImgUrl: productImgUrl,
            brandName: brandName,
            categoryName: categoryName,
            quantity: quantity,
            area: area,
            street: street,
            buildingNumber: buildingNumber,
            moreAddressInfo: moreAddressInfo,
            supplierLocation: supplierLocation,
            payMethod: payMethod,
            closedAt: closedAt);

  factory TenderHModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final name = json['name'];
    final productName = json['productName'];
    final productImgUrl = json['productImgUrl'];
    final brandName = json['brandName'];
    final categoryName = json['categoryName'];
    final quantity = json['quantity'];
    final area = json['area'];
    final street = json['street'];
    final buildingNumber = json['buildingNumber'];
    final moreAddressInfo = json['moreAddressInfo'];
    final supplierLocation = json['supplierLocation'];
    final payMethod = json['payMethod'];
    final closedAt = json['closedAt'];
    return TenderHModel(
        status: status,
        name: name,
        productName: productName,
        productImgUrl: productImgUrl,
        brandName: brandName,
        categoryName: categoryName,
        quantity: quantity,
        area: area,
        street: street,
        buildingNumber: buildingNumber,
        moreAddressInfo: moreAddressInfo,
        supplierLocation: supplierLocation,
        payMethod: payMethod,
        closedAt: closedAt);
  }
}
