

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesChooseTenderUseCase {
  final ChooseTenderRepositories chooseTenderRepositories;
  const GetCategoriesChooseTenderUseCase({
    required this.chooseTenderRepositories,
});
  Future<Either<Failure,List<CategoriesChooseTenderEntity>>>call()async{
    return await chooseTenderRepositories.getCategories();
  }

}