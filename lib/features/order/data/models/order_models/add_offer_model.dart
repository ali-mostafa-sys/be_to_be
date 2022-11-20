import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';

class AddOfferModel extends AddOfferEntity{
  // final int tenderId;
  // final int quantity;
  // final double priceUSD;
  // final bool includeDelivery;
  // final double? deliveryCost;
  const AddOfferModel({
    required int tenderId,
    required int quantity,
    required double priceUSD,
    required bool includeDelivery,
    double? deliveryCost
}):super(tenderId: tenderId,quantity: quantity,priceUSD: priceUSD,includeDelivery: includeDelivery,deliveryCost: deliveryCost);

  Map<String,dynamic>toJson(){

    if(includeDelivery!=false){
      return {
        "tenderId":tenderId.toString(),
        "quantity":quantity.toString(),
        "priceUSD":priceUSD.toString(),
        "bIncludeDelivery":includeDelivery.toString(),
        "deliveryCost":deliveryCost.toString(),
        "deliveryAddress":"",
      };
    }else{
      return {
        "tenderId":tenderId.toString(),
        "quantity":quantity.toString(),
        "priceUSD":priceUSD.toString(),
        "bIncludeDelivery":includeDelivery.toString(),
        "deliveryCost":"",
        "deliveryAddress":""
      };
    }

  }

}