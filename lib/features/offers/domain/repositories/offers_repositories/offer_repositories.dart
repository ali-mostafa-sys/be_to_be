

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/entity/cities_entity/cities_offer_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OfferRepositories {

  Future<Either<Failure,List<GetAllTenderEntity>>>getAllTender();
  Future<Either<Failure,List<GetAllOfferOnTenderEntity>>>getAllOffersOnTender(int tenderId);
  Future<Either<Failure,Unit>>deleteOffer(int offerId);
  Future<Either<Failure,List<CitiesOfferEntity>>>getOfferCities();
  Future<Either<Failure,Unit>>postAcceptOffer(int offerId);
}