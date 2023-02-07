



import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class AddProductUseCase {

  final CreateTenderRepositories createTenderRepositories;
  const AddProductUseCase({
    required this.createTenderRepositories,
  });
  Future<Either<Failure,Unit>>call(AddProductEntity addProductEntity)async{
    return createTenderRepositories.postAddProduct(addProductEntity);


  }
}