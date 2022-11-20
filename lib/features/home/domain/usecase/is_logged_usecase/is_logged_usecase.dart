

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';
import 'package:be_to_be/features/home/domain/repositories/main_repositories.dart';
import 'package:dartz/dartz.dart';

class IsLoggedUseCase {
  final MainRepositories mainRepositories;
  const IsLoggedUseCase({required this.mainRepositories});

  Future<Either<Failure,IsLoggedEntity>>call()async{
    return await mainRepositories.getIsLogged();
  }

}