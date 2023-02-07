

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/privacy/data/data_source/privacy_remote_data_source.dart';
import 'package:be_to_be/features/privacy/domain/entity/privacy_entity.dart';
import 'package:be_to_be/features/privacy/domain/repositories/privacy_repositories.dart';
import 'package:dartz/dartz.dart';

class PrivacyRepositoriesImpl implements PrivacyRepositories{
  final NetworkInfo networkInfo;
  final PrivacyRemoteDataSource privacyRemoteDataSource;
  PrivacyRepositoriesImpl({
    required this.privacyRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PrivacyEntity>> getPrivacy()async {
    if(await networkInfo.isConnected){
      try{

        final privacy=await privacyRemoteDataSource.getPrivacy();
        return Right(privacy);

      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }





}