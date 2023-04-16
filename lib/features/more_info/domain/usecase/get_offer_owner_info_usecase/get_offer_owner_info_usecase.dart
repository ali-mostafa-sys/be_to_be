

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/more_info/domain/entity/offer_owner_info_entity/offer_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/repositories/more_info_b2b_repositories/more_info_b2b_repositories.dart';
import 'package:dartz/dartz.dart';

class GetOfferOwnerInfoUseCase{
  final MoreInfoB2BRepositories moreInfoB2BRepositories;

  GetOfferOwnerInfoUseCase({
    required this.moreInfoB2BRepositories
  });

  Future<Either<Failure,OfferOwnerInfoEntity>>call(int offerId)async{
    return await moreInfoB2BRepositories.getOfferOwnerInfo(offerId);
  }



}