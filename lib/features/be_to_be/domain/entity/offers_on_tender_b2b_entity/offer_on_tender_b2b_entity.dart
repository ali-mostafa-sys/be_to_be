


import 'package:equatable/equatable.dart';

class OffersOnTendersB2BEntity extends Equatable{
  final int idOffer;
  final int tenderId;
  final int quantity;
  final int bIncludeDelivery;

  final int priceUSD;
  final String? tax;
  final int? deliveryCost;

  const OffersOnTendersB2BEntity({
    required this.bIncludeDelivery,
    required this.quantity,
    required this.tenderId,
    required this.idOffer,
    required this.priceUSD,
    required this.tax,
    required this.deliveryCost,

});




  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,idOffer,quantity,bIncludeDelivery,priceUSD,tax,deliveryCost];

}