


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class AddBrandUseCase {

  final CreateTenderRepositories createTenderRepositories;
  const AddBrandUseCase({
    required this.createTenderRepositories,
});
  Future<Either<Failure,Unit>>call(AddBrandEntity addBrandEntity)async{
    return createTenderRepositories.postAddBrand(addBrandEntity);

  }
}