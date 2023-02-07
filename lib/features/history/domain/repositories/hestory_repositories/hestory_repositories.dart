

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';
import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepositories{


  Future<Either<Failure,List<TenderHEntity>>>getHistoryTenders();

  Future<Either<Failure,List<OrderHEntity>>> getHistoryOrder();



}