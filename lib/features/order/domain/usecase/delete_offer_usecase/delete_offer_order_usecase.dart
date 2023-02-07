

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:dartz/dartz.dart';

class DeleteOfferOrderUseCase{
  final OrdersRepositories ordersRepositories;
  const DeleteOfferOrderUseCase({
    required this.ordersRepositories
});


  Future<Either<Failure,Unit>>call(int offerId)async{
    return await ordersRepositories.deleteOffer(offerId);
  }


}