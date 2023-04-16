

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/my_interests_entity/my_interests_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class GetMyInterestsUseCase {
  final ChooseTenderRepositories chooseTenderRepositories;
  const GetMyInterestsUseCase({required this.chooseTenderRepositories});

  Future<Either<Failure,List<MyInterestsEntity>>>call()async{
    return await chooseTenderRepositories.getMyInterests();
  }
}