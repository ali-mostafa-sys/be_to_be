import 'package:equatable/equatable.dart';

class TenderHEntity extends Equatable {
  final String status;
  final String name;
  final String productName;
  final String? productImgUrl;
  final String brandName;
  final String categoryName;
  final int quantity;
  final String area;
  final String street;
  final String buildingNumber;
  final String moreAddressInfo;
  final String supplierLocation;
  final String payMethod;
  final String? closedAt;

  const TenderHEntity(
      {required this.status,
      required this.name,
      required this.productName,
      required this.productImgUrl,
      required this.brandName,
      required this.categoryName,
      required this.quantity,
      required this.area,
      required this.street,
      required this.buildingNumber,
      required this.moreAddressInfo,
      required this.supplierLocation,
      required this.payMethod,
      required this.closedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        name,
        productName,
        productImgUrl,
        brandName,
        categoryName,
        quantity,
        area,
        street,
        buildingNumber,
        moreAddressInfo,
        supplierLocation,
        payMethod,
        closedAt
      ];
}
