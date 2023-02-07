


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/terms/data/data_source/terms_remote_data_source.dart';
import 'package:be_to_be/features/terms/domain/entity/terms_entity.dart';
import 'package:be_to_be/features/terms/domain/repositories/terms_repositories.dart';
import 'package:dartz/dartz.dart';

class TermsRepositoriesImpl implements TermsRepositories{






  final NetworkInfo networkInfo;
  final TermsRemoteDataSource termsRemoteDataSource;
  TermsRepositoriesImpl({
    required this.termsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TermsEntity>> getTerms()async {
    if(await networkInfo.isConnected){
      try{

        final terms=await termsRemoteDataSource.getTerms();
        return Right(terms);

      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }


}