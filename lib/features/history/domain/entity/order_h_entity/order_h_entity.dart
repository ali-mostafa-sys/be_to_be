import 'package:equatable/equatable.dart';

class OrderHEntity extends Equatable {
  final String? status;
  final String? productImgUrl;
  final String? deliveryAddress;
  final String? acceptedAt;
  final String? excutedAt;
  final String? creatAt;
  final String productName;
  final String brandName;
  final String categoryName;
  final int quantity;
  final int tenderQuantity;
  final int priceUSD;
  final int bIncludeDelivery;
  final dynamic deliveryCost;
  final dynamic tax;

  OrderHEntity({
    required this.status,
    required this.productImgUrl,
    required this.deliveryAddress,
    required this.productName,
    required this.brandName,
    required this.categoryName,
    required this.quantity,
    required this.tenderQuantity,
    required this.priceUSD,
    required this.bIncludeDelivery,
    required this.deliveryCost,
    required this.tax,
    required this.acceptedAt,
    required this.excutedAt,
    required this.creatAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[status,productImgUrl,deliveryAddress,productName,brandName,categoryName,quantity,tenderQuantity,priceUSD,
  bIncludeDelivery,deliveryCost,tax,acceptedAt,excutedAt,creatAt,
  ];
}
