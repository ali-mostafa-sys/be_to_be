


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/offers_on_tender_b2b_entity/offer_on_tender_b2b_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/repositories/be_to_be_repositories/be_to_be_repositories.dart';
import 'package:dartz/dartz.dart';

class GetOffersOnTenderB2BUseCase{
  final BeToBeRepositories beToBeRepositories;
  GetOffersOnTenderB2BUseCase({
    required this.beToBeRepositories
});
  Future<Either<Failure,List<OffersOnTendersB2BEntity>>>call({required int tenderId,required int isExecuted})async{
    return await beToBeRepositories.getAllOffers(tenderId:tenderId, isExecuted:isExecuted);
  }



}