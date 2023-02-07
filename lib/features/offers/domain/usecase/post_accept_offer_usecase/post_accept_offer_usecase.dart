

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class PostAcceptOfferUseCase{

  final OfferRepositories offerRepositories;
  const PostAcceptOfferUseCase({
    required this.offerRepositories
});


  Future<Either<Failure,Unit>>call(int offerId)async{
    return await offerRepositories.postAcceptOffer(offerId);

  }


}