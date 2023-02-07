

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllOffersUseCase {

  final OfferRepositories offerRepositories;
  const GetAllOffersUseCase({required this.offerRepositories});

  Future<Either<Failure,List<GetAllOfferOnTenderEntity>>> call(int tenderId)async{
    return offerRepositories.getAllOffersOnTender(tenderId);
  }
}