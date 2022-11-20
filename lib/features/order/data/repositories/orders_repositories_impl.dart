

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/order/data/data_source/orders_remote_data_source/orders_remote_data_source.dart';
import 'package:be_to_be/features/order/data/models/order_models/add_offer_model.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';
import 'package:be_to_be/features/order/domain/repositories/orders_repositories/order_repositories.dart';
import 'package:dartz/dartz.dart';

class OrdersRepositoriesImpl implements OrdersRepositories{

  final OrdersRemoteDataSource ordersRemoteDataSource;
  final NetworkInfo networkInfo;

  const OrdersRepositoriesImpl({
    required this.ordersRemoteDataSource,
    required this.networkInfo
});

///
  /// here for get all order
  ///
  @override
  Future<Either<Failure, List<GetOrderEntity>>> getOrders() async{

    if(await networkInfo.isConnected){
      try{
        final listGetOrderEntity=await ordersRemoteDataSource.getOrders();

        return Right(listGetOrderEntity);


      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
      return Left(OfflineFailure());
    }
  }
///
  /// here for add offer
  ///
  @override
  Future<Either<Failure, Unit>> postAddOffer(AddOfferEntity addOfferEntity)async {

      final addOfferModel=AddOfferModel(tenderId: addOfferEntity.tenderId, quantity:addOfferEntity. quantity,
          priceUSD:addOfferEntity. priceUSD, includeDelivery:addOfferEntity. includeDelivery,deliveryCost: addOfferEntity.deliveryCost);

      if(await networkInfo.isConnected){
        try{
          await ordersRemoteDataSource.postAddOffer(addOfferModel);

          return const Right(unit);


        }on ServerException{
          return Left(ServerFailure());
        }

      }else{
        return Left(OfflineFailure());
      }


  }

}