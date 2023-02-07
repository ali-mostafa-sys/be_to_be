import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';

class AddOfferModel extends AddOfferEntity{
  const AddOfferModel({
    required int tenderId,
    required int quantity,
    required double priceUSD,
    required int includeDelivery,
   required double? deliveryCost,
    required double? tax
}):super(tenderId: tenderId,quantity: quantity,priceUSD: priceUSD,includeDelivery: includeDelivery,deliveryCost: deliveryCost,tax: tax);

  Map<String,dynamic>toJson(){

    return {
      "tenderId":tenderId.toString(),
          "quantity":quantity.toString(),
          "priceUSD":priceUSD.toString(),
          "bIncludeDelivery":includeDelivery.toString(),
          "deliveryCost":deliveryCost.toString(),
          "deliveryAddress":"",
          "tax":tax.toString()

    };
  }

}


// if(includeDelivery!=false){
//   return {
//     "tenderId":tenderId.toString(),
//     "quantity":quantity.toString(),
//     "priceUSD":priceUSD.toString(),
//     "bIncludeDelivery":includeDelivery.toString(),
//     "deliveryCost":deliveryCost.toString(),
//     "deliveryAddress":"",
//     if(tax!=null)
//       "tax":tax.toString()
//   };
// }else{
//   return {
//     "tenderId":tenderId.toString(),
//     "quantity":quantity.toString(),
//     "priceUSD":priceUSD.toString(),
//     "bIncludeDelivery":includeDelivery.toString(),
//     "deliveryCost":"",
//     "deliveryAddress":"",
//     if(tax!=null)
//       "tax":tax.toString()
//   };
// }