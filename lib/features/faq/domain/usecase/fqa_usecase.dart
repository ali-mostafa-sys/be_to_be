


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/faq/domain/entity/fqa_entity.dart';
import 'package:be_to_be/features/faq/domain/repositories/fqa_repositories.dart';
import 'package:dartz/dartz.dart';

class GetFQAUseCase{

  final FQARepositories fqaRepositories;

  const GetFQAUseCase({
    required this.fqaRepositories
});
  Future<Either<Failure,List<FQAEntity>>>call()async{

    return await fqaRepositories.getFQA();
  }

}