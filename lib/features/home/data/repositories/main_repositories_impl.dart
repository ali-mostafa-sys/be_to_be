


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/home/data/data_source/remote_main_data_source/remote_main_data_source.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:dartz/dartz.dart';

class MainRepositoriesImpl implements MainRepositories{

  final MainRemoteDataSource mainRemoteDataSource;
  final NetworkInfo networkInfo;


  const MainRepositoriesImpl({required this.mainRemoteDataSource,required this.networkInfo});




  @override
  Future<Either<Failure, IsLoggedEntity>> getIsLogged() async{

    if (await networkInfo.isConnected) {
      try {
        final isLoggedModel= await mainRemoteDataSource.getIsLogged();

        return  Right(isLoggedModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}