import 'dart:ffi';

import 'package:be_to_be/features/order/domain/entity/my_offer_entity/mu_offer_entity.dart';

class MyOfferModel extends MyOfferEntity{
  MyOfferModel({required int tenderId,
    required int idOffer,
    required int quantity,
    required int bIncludeDelivery,
    required int? deliveryCost,
    required int priceUSD,
    required int? tax,
    required String status})
      : super(tenderId: tenderId,
      idOffer: idOffer,
      quantity: quantity,
      bIncludeDelivery: bIncludeDelivery,
      deliveryCost: deliveryCost,
      priceUSD: priceUSD,
      tax: tax,
      status: status);

  factory MyOfferModel.fromJson(Map<String,dynamic>json){
    final tenderId=json['tenderId'];
    final idOffer=json['idOffer'];
    final quantity=json['quantity'];
    final bIncludeDelivery=json['bIncludeDelivery'];
    final deliveryCost=json['deliveryCost'];
    final priceUSD=json['priceUSD'] ;
    final tax=json['tax'];
    final status=json['status'];
    return MyOfferModel(tenderId: tenderId,
        idOffer: idOffer, quantity: quantity, bIncludeDelivery: bIncludeDelivery,
        deliveryCost: deliveryCost, priceUSD: priceUSD, tax: tax, status: status);
  }



}