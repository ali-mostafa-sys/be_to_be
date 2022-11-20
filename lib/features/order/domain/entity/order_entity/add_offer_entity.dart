import 'package:equatable/equatable.dart';

class AddOfferEntity extends Equatable{
  final int tenderId;
  final int quantity;
  final double priceUSD;
  final bool includeDelivery;
  final double? deliveryCost;
  const AddOfferEntity({
    required this.tenderId,
    required this.quantity,
    required this.priceUSD,
    required this.includeDelivery,
    this.deliveryCost,
});



  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,quantity,priceUSD,includeDelivery,deliveryCost];

}