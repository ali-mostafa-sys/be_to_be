


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/launcher/data/data_source/launcher_remote_data_source.dart';
import 'package:be_to_be/features/launcher/domain/repositories/launcher_cities_repositories.dart';
import 'package:dartz/dartz.dart';

class LauncherRepositoriesImpl implements LauncherRepositories{
  final LauncherRemoteDataSource launcherRemoteDataSource;
  final NetworkInfo networkInfo;
  LauncherRepositoriesImpl({
    required this.networkInfo,
    required this.launcherRemoteDataSource,
});
  @override
  Future<Either<Failure, Unit>> getCities()async {

  if(await networkInfo.isConnected){
    try{

      await launcherRemoteDataSource.getCities();
      return const  Right(unit);




    }on ServerException{
      return Left(ServerFailure());
    }
  }else{
    return Left(OfflineFailure());

  }
  }

}