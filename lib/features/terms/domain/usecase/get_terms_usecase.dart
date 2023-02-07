

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/terms/domain/entity/terms_entity.dart';
import 'package:be_to_be/features/terms/domain/repositories/terms_repositories.dart';
import 'package:dartz/dartz.dart';

class GetTermsUseCase{

  final TermsRepositories termsRepositories;
  const GetTermsUseCase({
    required this.termsRepositories
});
  Future<Either<Failure,TermsEntity>>call()async{
    return await termsRepositories.getTerms() ;
  }

}