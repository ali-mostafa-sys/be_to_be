

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/verification_account/data/data_source/verirfication_remote_data_source.dart';
import 'package:be_to_be/features/verification_account/domain/repositories/verification_repositories.dart';
import 'package:dartz/dartz.dart';

class VerificationRepositoriesImpl implements VerificationRepositories{
  final NetworkInfo networkInfo;
  final VerificationRemoteDataSource verificationRemoteDataSource;

  const VerificationRepositoriesImpl({
    required this.verificationRemoteDataSource,
    required this.networkInfo
});


  ///
  /// here for get verification code
  ///
  @override
  Future<Either<Failure, Unit>> postVerificationCode(String loginName) async{
   if(await networkInfo.isConnected){
     try{
       await verificationRemoteDataSource.postVerificationCode(loginName);
       return const Right(unit);


     }on ServerException{
       return Left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }
///
  /// here for get verification code value
  ///
  @override
  Future<Either<Failure, Unit>> getVerificationCode(String loginName, String code) async{

    if(await networkInfo.isConnected){
      try{

        await verificationRemoteDataSource.getVerificationCode(loginName, code);
        return const Right(unit);

      }on ServerException{
        return Left(ServerFailure());
    }on VerificationConflictException{
        return Left(VerificationConflictFailure(  ));
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}