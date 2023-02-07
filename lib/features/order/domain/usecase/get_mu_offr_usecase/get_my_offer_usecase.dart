

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/order/domain/entity/my_offer_entity/mu_offer_entity.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:dartz/dartz.dart';

class GetMyOfferUseCase{

  final OrdersRepositories ordersRepositories;
  const GetMyOfferUseCase({
    required this.ordersRepositories,
});

  Future<Either<Failure,MyOfferEntity>>call({
   required int tenderId,required int creatByUserId,
})async {
    return await ordersRepositories.getMyOffer(tenderId, creatByUserId);
  }

}