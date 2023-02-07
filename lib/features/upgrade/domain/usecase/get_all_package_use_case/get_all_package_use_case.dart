

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:be_to_be/features/upgrade/domain/repositories/upgrae_repositories/upgrade_reposirories.dart';
import 'package:dartz/dartz.dart';

class GetAllPackageUseCase {
  final UpgradeRepositories upgradeRepositories;
  const GetAllPackageUseCase({required this.upgradeRepositories});
  Future<Either<Failure,List<UpgradeEntity>>>call()async{
    return await upgradeRepositories.getAllPackages();
  }

}