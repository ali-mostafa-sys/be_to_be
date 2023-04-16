import 'package:equatable/equatable.dart';

class BeToBeEntity extends Equatable {


  final int idTender;
  final int tenderQuantity;
  final int tenderCreatorUserId;
  final int? cityId;
  final String name;
  final String status;
  final String productName;
  final String brandName;
 // final String closedAt;
  final String categoryName;
  final String? productImgUrl;
  final String? area;
  final String? street;
  final String? supplierLocation;

  BeToBeEntity({
  required  this.idTender,
    required  this.tenderQuantity,
    required  this.tenderCreatorUserId,
    required  this.name,
    required  this.status,
    required  this.productName,
    required  this.brandName,
   // required this.closedAt,
    required  this.categoryName,
    required  this.productImgUrl,
    required  this.area,
    required  this.cityId,
    required  this.street,
    required  this.supplierLocation
});

  @override
  // TODO: implement props
  List<Object?> get props => [cityId,
    idTender,tenderQuantity,name,status,productName,brandName,
   // closedAt,
    tenderCreatorUserId,categoryName,productImgUrl,area,street,supplierLocation];
}
