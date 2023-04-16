import 'package:be_to_be/features/be_to_be/domain/entity/offers_on_tender_b2b_entity/offer_on_tender_b2b_entity.dart';

class OffersOnTenderB2B2Model extends OffersOnTendersB2BEntity {
  const OffersOnTenderB2B2Model({
    required int bIncludeDelivery,
    required int quantity,
    required int tenderId,
    required int idOffer,
    required int priceUSD,
    required String? tax,
    required int? deliveryCost,
  }) : super(
            bIncludeDelivery: bIncludeDelivery,
            quantity: quantity,
            tenderId: tenderId,
            idOffer: idOffer,
            deliveryCost: deliveryCost,
            tax: tax,
            priceUSD: priceUSD);

  factory OffersOnTenderB2B2Model.fromJson(Map<String, dynamic> json) {
    final idOffer = json['idOffer'];
    final tenderId = json['tenderId'];
    final quantity = json['quantity'];
    final bIncludeDelivery = json['bIncludeDelivery'];

    final tax =json['tax']==null?null:
    json['tax'].toString();
    final deliveryCost = json['deliveryCost'];
    final priceUSD = json['priceUSD'];
    return OffersOnTenderB2B2Model(
        bIncludeDelivery: bIncludeDelivery,
        quantity: quantity,
        tenderId: tenderId,
        idOffer: idOffer,
      priceUSD: priceUSD,
      tax: tax,
      deliveryCost: deliveryCost,

    );
  }
}
