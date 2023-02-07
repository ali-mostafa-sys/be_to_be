

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';
import 'package:be_to_be/features/offers/domain/repositories/offers_repositories/offer_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllTenderUseCase {

  final OfferRepositories offerRepositories;
  const GetAllTenderUseCase({
    required this.offerRepositories
});
  Future<Either<Failure,List<GetAllTenderEntity>>>call()async{
    return await offerRepositories.getAllTender();
  }

}