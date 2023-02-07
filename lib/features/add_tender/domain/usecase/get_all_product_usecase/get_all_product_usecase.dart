

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/add_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllProductUseCase{

  final AddTenderRepositories addTenderRepositories;
  const GetAllProductUseCase({required this.addTenderRepositories});

  Future<Either<Failure,List<ProductEntity>>>call()async{

    return await addTenderRepositories.getAllProduct();
  }

}