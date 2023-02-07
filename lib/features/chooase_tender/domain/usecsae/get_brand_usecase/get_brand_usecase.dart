


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';


class GetBrandsChooseTenderUseCase {
  final ChooseTenderRepositories chooseTenderRepositories;
   GetBrandsChooseTenderUseCase ({
    required this.chooseTenderRepositories
});

  Future<Either<Failure,List<BrandChooseTenderEntity>>>call()async{

    return await chooseTenderRepositories.getBrand();
  }
}