



import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/order/domain/entity/my_offer_entity/mu_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepositories{

  Future<Either<Failure,List<GetOrderEntity>>>getOrders();

  Future<Either<Failure,Unit>>postAddOffer(AddOfferEntity addOfferEntity);
  Future<Either<Failure,MyOfferEntity>>getMyOffer(int tenderId,int creatByUserId);
  Future<Either<Failure,Unit>>deleteOffer(int offerId);

}