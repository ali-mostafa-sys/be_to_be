import 'package:equatable/equatable.dart';

class AddOfferEntity extends Equatable{
  final int tenderId;
  final int quantity;
  final double priceUSD;
  final int includeDelivery;
  final double? deliveryCost;
  final double? tax;
  const AddOfferEntity({
    required this.tenderId,
    required this.quantity,
    required this.priceUSD,
    required this.includeDelivery,
   required this.deliveryCost,
   required this.tax,
});



  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,quantity,priceUSD,includeDelivery,deliveryCost,tax];

}