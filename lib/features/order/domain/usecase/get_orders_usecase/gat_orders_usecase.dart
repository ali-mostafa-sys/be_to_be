

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:dartz/dartz.dart';

class GetOrdersUseCase {

  final OrdersRepositories ordersRepositories;

   GetOrdersUseCase({
    required this.ordersRepositories,
});
  Future<Either<Failure,List<GetOrderEntity>>>call()async{
    return await ordersRepositories.getOrders();

  }


}