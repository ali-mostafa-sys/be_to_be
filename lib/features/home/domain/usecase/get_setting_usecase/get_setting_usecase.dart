


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/home/domain/entiy/setting_entity/setting_entity.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:dartz/dartz.dart';

class GetSettingUseCase {

  final MainRepositories mainRepositories;
  const GetSettingUseCase({
    required this.mainRepositories,
});

  Future<Either<Failure,List<SettingEntity>>>call()async{
    return await mainRepositories.getSetting();
  }


}