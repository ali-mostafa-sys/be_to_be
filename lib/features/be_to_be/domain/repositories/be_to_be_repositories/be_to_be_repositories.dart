

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/offers_on_tender_b2b_entity/offer_on_tender_b2b_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BeToBeRepositories{

  Future<Either<Failure,List<BeToBeEntity>>>getBeToBePage(bool isPending);
  Future<Either<Failure,List<OffersOnTendersB2BEntity>>>getAllOffers({required int tenderId,required int isExecuted});
}
