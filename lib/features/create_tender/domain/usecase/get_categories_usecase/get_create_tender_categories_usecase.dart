


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/category_entity/category_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCreateTenderCategoriesUseCase{

  final CreateTenderRepositories createTenderRepositories;
  const GetCreateTenderCategoriesUseCase({
    required this.createTenderRepositories,
});
  Future<Either<Failure,List<CategoriesCreateTenderEntity>>>call()async{
    return await createTenderRepositories.getCategoriesOfCreate();

  }
}