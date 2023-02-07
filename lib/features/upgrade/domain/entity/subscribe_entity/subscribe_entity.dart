

import 'package:equatable/equatable.dart';

class SubscribeEntity extends Equatable{

  final String? promotionCode;
  final int subscriptionPackageId;
  const SubscribeEntity({
    required this.subscriptionPackageId,
    required this.promotionCode
});


  @override
  // TODO: implement props
  List<Object?> get props => [subscriptionPackageId,promotionCode];

}