

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/more_info/domain/repositories/more_info_b2b_repositories/more_info_b2b_repositories.dart';
import 'package:dartz/dartz.dart';

class PostOfferExecutedUseCase{

  final MoreInfoB2BRepositories moreInfoB2BRepositories;
  PostOfferExecutedUseCase({
    required this.moreInfoB2BRepositories
});
  Future<Either<Failure,Unit>>call(int offerId)async{
    return await moreInfoB2BRepositories.postOfferExecuted(offerId);
  }
}