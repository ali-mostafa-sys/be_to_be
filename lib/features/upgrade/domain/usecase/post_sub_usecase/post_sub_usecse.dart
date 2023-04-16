

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/domain/repositories/upgrae_repositories/upgrade_reposirories.dart';
import 'package:dartz/dartz.dart';

class PostSubscribeUseCase {
  final UpgradeRepositories upgradeRepositories;
  const PostSubscribeUseCase({
    required this.upgradeRepositories
});
  Future<Either<Failure,int>>call(SubscribeEntity subscribeEntity)async{
    return upgradeRepositories.postSubscribe(subscribeEntity);
    
  }
}