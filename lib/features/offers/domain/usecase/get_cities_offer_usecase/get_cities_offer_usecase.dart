

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/entity/cities_entity/cities_offer_entity.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCitiesOfferUseCase{

  final OfferRepositories offerRepositories;
  const GetCitiesOfferUseCase({
    required this.offerRepositories
});
  Future<Either<Failure,List<CitiesOfferEntity>>>call()async{

    return await offerRepositories.getOfferCities();
  }


}