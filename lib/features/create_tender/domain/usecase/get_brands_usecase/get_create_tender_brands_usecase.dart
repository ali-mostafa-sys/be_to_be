

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/brand_entity/brand_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCreateTenderBrandsUseCase{
  final CreateTenderRepositories createTenderRepositories;
  const GetCreateTenderBrandsUseCase({
    required this.createTenderRepositories,
});

  Future<Either<Failure,List<BrandCreateTenderEntity>>> call()async{
    return await createTenderRepositories.getBrandsOfCreate();
  }



}