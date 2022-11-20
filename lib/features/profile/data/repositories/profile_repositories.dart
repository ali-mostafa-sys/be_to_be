


import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/network/network_info.dart';
import 'package:be_to_be/features/profile/data/data_source/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:be_to_be/features/profile/data/models/profile_models/get_user_data_model.dart';
import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';
import 'package:be_to_be/features/profile/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoriesImpl implements ProfileRepositories{
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;
  const ProfileRepositoriesImpl({
    required this.profileRemoteDataSource,
    required this.networkInfo,
});
  ///here for get user data
  @override
  Future<Either<Failure, GetUserDataEntity>> getUserData() async{
    if (await networkInfo.isConnected) {
      try {
        final userDataModel= await profileRemoteDataSource.getUserData();

        return  Right(userDataModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
/// here for edit user info
  @override
  Future<Either<Failure, Unit>> postEditUserData(GetUserDataEntity userDataEntity) async{
   final userDataModel=GetUserDataModel(
       firstName: userDataEntity.firstName,
       lastName:userDataEntity. lastName,
       email: userDataEntity.email,
     mobile: userDataEntity.mobile,
     birthDate: userDataEntity.birthDate,
     password: userDataEntity.password,

   );

   if (await networkInfo.isConnected) {
     try {
        await profileRemoteDataSource.postUserData(userDataModel);

       return  Right(unit);
     } on ServerException {
       return left(ServerFailure());
     }
   } else {
     return Left(OfflineFailure());
   }

  }

}