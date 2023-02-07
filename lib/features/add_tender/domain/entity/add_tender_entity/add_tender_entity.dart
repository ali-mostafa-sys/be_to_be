

import 'package:equatable/equatable.dart';

class AddTenderEntity extends Equatable{
  final String name;
  final String from;
  final String to;
  final String deliverBefore;
  final String area;
  final String street;
  final String buildingNumber;
  final String moreAddressInfo;
  final String supplierLocation;
  final String payMethod;

  final int productId;
  final int quantity;
  final int cityId;

const AddTenderEntity({required this.name,required this.from,required this.to,required this.deliverBefore,required this.area,
required this. street,required this.buildingNumber,required this.moreAddressInfo,required this.supplierLocation,required this.payMethod,
required this.productId,required this.quantity,required this.cityId});


  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    from,
    to,
    deliverBefore,
    area,
    street,
    buildingNumber
    ,moreAddressInfo,
    supplierLocation,
    payMethod
    ,productId
    ,quantity
    ,cityId];

}