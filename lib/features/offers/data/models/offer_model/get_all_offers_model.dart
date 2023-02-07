


import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';

class GetAllOffersModel extends GetAllOfferOnTenderEntity{
  const GetAllOffersModel({
    required int idOffer,
    required int creatByUserId,
    required int quantity,
    required int priceUSD,
     int? bIncludeDelivery,
    required int deliveryCost,
    required int rate,
     int? tax,
     int? offerCityId,
    required String status,
     String? deliveryAddress,
}):super(idOffer: idOffer,creatByUserId: creatByUserId,quantity: quantity,priceUSD: priceUSD,bIncludeDelivery: bIncludeDelivery,deliveryCost: deliveryCost,
  tax: tax,status: status,deliveryAddress: deliveryAddress,rate: rate,offerCityId: offerCityId,
  );
  factory GetAllOffersModel.fromJson(Map<String,dynamic>json){
    final idOffer=json['idOffer'];
    final creatByUserId=json['creatByUserId'];
    final quantity=json['quantity'];
    final priceUSD=json['priceUSD'];
    final bIncludeDelivery=json['bIncludeDelivery'];
    final deliveryCost=json['deliveryCost'];
    final tax=json['tax'];
    final offerCityId=json['offerCityId'];
    final status=json['status'];
    final deliveryAddress=json['deliveryAddress'];
    final rate=json['offerCreatorScore'];
    return GetAllOffersModel(idOffer: idOffer, creatByUserId: creatByUserId,
        quantity: quantity, priceUSD: priceUSD, bIncludeDelivery: bIncludeDelivery,rate: rate,
        deliveryCost: deliveryCost, tax: tax, status: status, deliveryAddress: deliveryAddress,offerCityId: offerCityId);
  }


}