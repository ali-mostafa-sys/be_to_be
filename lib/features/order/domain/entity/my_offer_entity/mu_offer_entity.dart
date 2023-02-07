


import 'package:equatable/equatable.dart';

class MyOfferEntity extends Equatable{
  final int tenderId;
  final int idOffer;
  final int quantity;
  final int bIncludeDelivery;
  final int? deliveryCost;
  final int priceUSD;
  final int? tax;
  final String status;
  const MyOfferEntity({
    required this.tenderId,
    required this.idOffer,
    required this.quantity,
    required this.bIncludeDelivery,
    required this.deliveryCost,
    required this.priceUSD,
    required this.tax,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,idOffer,quantity,bIncludeDelivery,deliveryCost,priceUSD,tax,status];

}