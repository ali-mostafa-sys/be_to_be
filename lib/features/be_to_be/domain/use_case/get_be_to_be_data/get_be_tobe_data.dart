


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';
import 'package:be_to_be/features/be_to_be/domain/repositories/be_to_be_repositories/be_to_be_repositories.dart';
import 'package:dartz/dartz.dart';

class GetBeToBeData{
final BeToBeRepositories beToBeRepositories;
const GetBeToBeData({required this.beToBeRepositories});
  Future<Either<Failure,List<BeToBeEntity>>>call()async{
    return beToBeRepositories.getBeToBePage();
  }
}