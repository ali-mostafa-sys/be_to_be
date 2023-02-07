

import 'package:equatable/equatable.dart';

class GetAllOfferOnTenderEntity extends Equatable{
  // "offerCityId": null,
  // "acceptedAt": null,
  // "excutedAt": null,
  // "creatAt": "2022-11-15T09:33:50.000Z",
  // "tenderCreatorByUserId": 6,
  // "productId": 4,
  // "tenderQuantity": 50,
  // "offerCreatorScore": 100

  final int idOffer;
  final int creatByUserId;
  final int quantity;
  final int priceUSD;
  final int? bIncludeDelivery;
  final int deliveryCost;
  final int rate;
  final int? tax;
  final int? offerCityId;
  final String status;
  final String? deliveryAddress;
  const GetAllOfferOnTenderEntity({
    required this.status,
    required this.idOffer,
    required this.creatByUserId,
    required this.quantity,
    required this.priceUSD,
    required this.rate,
     this.bIncludeDelivery,
    required this.deliveryCost,
     this.tax,
     this.offerCityId,
     this.deliveryAddress,

});

  @override
  // TODO: implement props
  List<Object?> get props => [status,idOffer,creatByUserId,quantity,priceUSD,bIncludeDelivery,deliveryCost,tax,deliveryAddress,rate,offerCityId];

}