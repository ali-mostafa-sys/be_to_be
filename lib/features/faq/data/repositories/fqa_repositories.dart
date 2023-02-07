


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/faq/data/data_source/fqa_remote_data_source.dart';
import 'package:be_to_be/features/faq/domain/entity/fqa_entity.dart';
import 'package:be_to_be/features/faq/domain/repositories/fqa_repositories.dart';
import 'package:dartz/dartz.dart';

class FQARepositoriesImpl implements FQARepositories{

  final NetworkInfo networkInfo;
  final FAQRemoteDataSource faqRemoteDataSource;
  FQARepositoriesImpl({
    required this.faqRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<FQAEntity>>> getFQA() async{
    if(await networkInfo.isConnected){
      try{

        final fqa=await faqRemoteDataSource.getFQA();
        return Right(fqa);


      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }







}