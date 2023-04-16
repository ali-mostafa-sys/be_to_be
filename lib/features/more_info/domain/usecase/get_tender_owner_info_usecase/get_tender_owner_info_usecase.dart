


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/more_info/domain/entity/tender_owner_info_entity/tender_owner_info_entity.dart';
import 'package:be_to_be/features/more_info/domain/repositories/more_info_b2b_repositories/more_info_b2b_repositories.dart';
import 'package:dartz/dartz.dart';

class GetTenderOwnerInfoUseCase{
  final MoreInfoB2BRepositories moreInfoB2BRepositories;

  GetTenderOwnerInfoUseCase({
    required this.moreInfoB2BRepositories
});

  Future<Either<Failure,TenderOwnerInfoEntity>>call(int tenderId)async{
    return await moreInfoB2BRepositories.getTenderOwnerInfo(tenderId);
  }


}