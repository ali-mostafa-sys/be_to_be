


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class DeleteOfferUseCase {

  final OfferRepositories offerRepositories;
  const DeleteOfferUseCase({required this.offerRepositories});

  Future<Either<Failure,Unit>>call(int offerId)async{
    return offerRepositories.deleteOffer(offerId);

  }

}