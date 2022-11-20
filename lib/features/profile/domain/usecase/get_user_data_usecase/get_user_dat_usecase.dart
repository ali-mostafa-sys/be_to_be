


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';
import 'package:be_to_be/features/profile/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUseCase {

  final ProfileRepositories profileRepositories;
  const GetUserDataUseCase({required this.profileRepositories});

  Future<Either<Failure,GetUserDataEntity>>call()async{
   return  await profileRepositories.getUserData();
  }

}