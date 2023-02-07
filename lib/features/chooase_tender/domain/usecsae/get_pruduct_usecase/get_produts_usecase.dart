


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetProductsChooseTenderUseCase {
  final ChooseTenderRepositories chooseTenderRepositories;
  GetProductsChooseTenderUseCase ({
    required this.chooseTenderRepositories
  });

  Future<Either<Failure,List<ProductChooseTenderEntity>>>call()async{

    return await chooseTenderRepositories.getProducts();
  }
}