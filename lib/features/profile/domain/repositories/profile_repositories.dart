


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepositories {

  Future<Either<Failure,GetUserDataEntity>>getUserData();
  Future <Either<Failure,Unit>>postEditUserData(GetUserDataEntity userDataEntity);


}