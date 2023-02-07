


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/about_us/data/data_source/about_us_remote_data_source.dart';
import 'package:be_to_be/features/about_us/domain/entity/about_us_entity.dart';
import 'package:be_to_be/features/about_us/domain/repositories/about_us_repositories.dart';
import 'package:dartz/dartz.dart';

class AboutUsRepositoriesImpl implements AboutUsRepositories{
  final NetworkInfo networkInfo;
  final AboutUsRemoteDataSource aboutUsRemoteDataSource;
  AboutUsRepositoriesImpl({
    required this.aboutUsRemoteDataSource,
    required this.networkInfo,
});



  @override
  Future<Either<Failure, List<AboutUsEntity>>> getAboutUs() async{
    if(await networkInfo.isConnected){
      try{

        final aboutUs=await aboutUsRemoteDataSource.getAboutUs();
        return Right(aboutUs);

      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }




}