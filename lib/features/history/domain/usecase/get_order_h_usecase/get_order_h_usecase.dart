import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';
import 'package:be_to_be/features/history/domain/repositories/hestory_repositories/hestory_repositories.dart';
import 'package:dartz/dartz.dart';

class GetOrderHUseCase {
  final HistoryRepositories historyRepositories;

  const GetOrderHUseCase({required this.historyRepositories});

  Future<Either<Failure, List<OrderHEntity>>> call() async {
    return historyRepositories.getHistoryOrder();
  }
}
