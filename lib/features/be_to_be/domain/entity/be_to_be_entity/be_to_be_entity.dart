import 'package:equatable/equatable.dart';

class BeToBeEntity extends Equatable {
  // "from": "2023-01-25T11:34:17.000Z",
  // "to": "2023-01-30T00:00:00.000Z",

  // "buildingNumber": "DC building",

  // "moreAddressInfo": "Ali mostafa",

  // "closedAt": "2023-01-26T09:45:00.000Z"

  final int idTender;
  final int tenderQuantity;
  final String name;
  final String status;
  final String productName;
  final String brandName;
  final String closedAt;
  final String categoryName;
  final String? productImgUrl;
  final String? area;
  final String? street;
  final String? supplierLocation;

  BeToBeEntity({
  required  this.idTender,
    required  this.tenderQuantity,
    required  this.name,
    required  this.status,
    required  this.productName,
    required  this.brandName,
    required this.closedAt,
    required  this.categoryName,
    required  this.productImgUrl,
    required  this.area,
    required  this.street,
    required  this.supplierLocation
});

  @override
  // TODO: implement props
  List<Object?> get props => [idTender,tenderQuantity,name,status,productName,brandName,closedAt,categoryName,productImgUrl,area,street,supplierLocation];
}
