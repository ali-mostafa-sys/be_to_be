


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:be_to_be/features/contact_us/domain/entity/contact_us_entity.dart';
import 'package:be_to_be/features/contact_us/domain/repositories/contact_us_repositories.dart';
import 'package:dartz/dartz.dart';

class ContactUsRepositoriesImpl implements ContactUsRepositories{



  final NetworkInfo networkInfo;
  final ContactUsRemoteDataSource contactUsRemoteDataSource;
  ContactUsRepositoriesImpl({
    required this.contactUsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ContactUsEntity>> getContactUs() async{
    if(await networkInfo.isConnected){
      try{

        final contactUs=await contactUsRemoteDataSource.getContactUs();
        return Right(contactUs);

      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }
  }











}