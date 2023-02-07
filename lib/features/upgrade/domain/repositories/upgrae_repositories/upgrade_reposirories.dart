
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UpgradeRepositories{
  Future<Either<Failure,List<UpgradeEntity>>>getAllPackages();
  Future<Either<Failure,Unit>>postSubscribe(SubscribeEntity subscribeEntity);

}