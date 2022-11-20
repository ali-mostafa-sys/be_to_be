

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:dartz/dartz.dart';

class PostAddOfferUseCase {

  final OrdersRepositories ordersRepositories;
  const PostAddOfferUseCase({
    required this.ordersRepositories
});
  Future<Either<Failure,Unit>>call(AddOfferEntity addOfferEntity)async{
    return await ordersRepositories.postAddOffer(addOfferEntity);
  }


}