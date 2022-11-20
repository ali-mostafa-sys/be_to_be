


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/be_to_be/data/data_source/be_to_be_remote_data_source/be_to_be_remote_data_source.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/repositories/be_to_be_repositories/be_to_be_repositories.dart';
import 'package:dartz/dartz.dart';

class BeToBeRepositoriesImpl implements BeToBeRepositories{

  final BeToBeDataSource beDataSource;
  final NetworkInfo networkInfo;
  const BeToBeRepositoriesImpl({required this.beDataSource,required this.networkInfo});

  ///
  /// here for get all data
  ///
  @override
  Future<Either<Failure, List<BeToBeEntity>>> getBeToBePage()async {


    if(await networkInfo.isConnected){
      try{
        final listOfData=await beDataSource.getBeToBeData();
        return Right(listOfData);


      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }

    // TODO: implement getBeToBePage
    throw UnimplementedError();
  }


}