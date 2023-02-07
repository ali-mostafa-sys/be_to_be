

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/domain/entiy/package_used_entity/package_used_entity.dart';
import 'package:be_to_be/features/home/domain/entiy/setting_entity/setting_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepositories {
  Future <Either<Failure,IsLoggedEntity>>getIsLogged();
  Future<Either<Failure,PackageUsedEntity>>getPackageUsed();
  Future<Either<Failure,List<SettingEntity>>>getSetting();
}