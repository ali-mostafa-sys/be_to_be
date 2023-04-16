

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/more_info/domain/entity/offer_owner_info_entity/offer_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/entity/tender_owner_info_entity/tender_owner_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoreInfoB2BRepositories{
  Future<Either<Failure,TenderOwnerInfoEntity>>getTenderOwnerInfo(int tenderId);
  Future<Either<Failure,OfferOwnerInfoEntity>>getOfferOwnerInfo(int offerId);
  Future<Either<Failure,Unit>>postOfferExecuted(int offerId);

}