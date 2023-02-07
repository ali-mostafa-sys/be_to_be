
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/home/domain/entiy/package_used_entity/package_used_entity.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:dartz/dartz.dart';

class GetPackageUsedUseCase {
  final MainRepositories mainRepositories;
  const GetPackageUsedUseCase({required this.mainRepositories});

  Future <Either<Failure,PackageUsedEntity>>call()async{
    return await mainRepositories.getPackageUsed();
  }
}