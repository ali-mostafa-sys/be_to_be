


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/repositories/choose_tender_repositories/choose_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class PostCareUseCase {

  final ChooseTenderRepositories chooseTenderRepositories;
  const PostCareUseCase({
    required this.chooseTenderRepositories
});
  Future<Either<Failure,Unit>>call(DataEntity dataEntity)async{
    return chooseTenderRepositories.postCare(dataEntity);

  }
}