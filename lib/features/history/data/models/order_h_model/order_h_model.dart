import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';

class OrderHModel extends OrderHEntity {
  OrderHModel({required String? status,
    required String? productImgUrl,
    required String? deliveryAddress,
    required String? acceptedAt,
    required String? excutedAt,
    required String? creatAt,
    required String productName,
    required String brandName,
    required String categoryName,
    required int quantity,
    required int tenderQuantity,
    required int priceUSD,
    required int bIncludeDelivery,
    required dynamic deliveryCost,
    required dynamic tax})
      : super(
      status: status,
      productImgUrl: productImgUrl,
      deliveryAddress: deliveryAddress,
      productName: productName,
      brandName: brandName,
      categoryName: categoryName,
      quantity: quantity,
      tenderQuantity: tenderQuantity,
      priceUSD: priceUSD,
      bIncludeDelivery: bIncludeDelivery,
      deliveryCost: deliveryCost,
      tax: tax,
    acceptedAt: acceptedAt,creatAt: creatAt,excutedAt: excutedAt
  );

  factory OrderHModel.fromJson(Map<String, dynamic>json){
    final status = json['status'];
    final acceptedAt = json['acceptedAt'];
    final creatAt = json['creatAt'];
    final excutedAt = json['excutedAt'];
    final productImgUrl = json['productImgUrl'];
    final deliveryAddress = json['deliveryAddress'];
    final productName = json['productName'];
    final brandName = json['brandName'];
    final categoryName = json['categoryName'];
    final quantity = json['quantity'];
    final tenderQuantity = json['tenderQuantity'];
    final priceUSD = json['priceUSD'];
    final bIncludeDelivery = json['bIncludeDelivery'];
    final deliveryCost = json['deliveryCost'];
    final tax = json['tax'];
    return OrderHModel(status: status,
        productImgUrl: productImgUrl,
        deliveryAddress: deliveryAddress,
        productName: productName,
        brandName: brandName,
        categoryName: categoryName,
        quantity: quantity,
        tenderQuantity: tenderQuantity,
        priceUSD: priceUSD,
        bIncludeDelivery: bIncludeDelivery,
        deliveryCost: deliveryCost,
        tax: tax,
      excutedAt: excutedAt,creatAt: creatAt,acceptedAt: acceptedAt
    );

  }
}
