

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';
import 'package:be_to_be/features/history/domain/repositories/hestory_repositories/hestory_repositories.dart';
import 'package:dartz/dartz.dart';

class GetTenderHUseCase{

  final HistoryRepositories historyRepositories;

 const  GetTenderHUseCase({required this.historyRepositories});

  Future<Either<Failure,List<TenderHEntity>>>call()async{
    return await historyRepositories.getHistoryTenders();
  }




}