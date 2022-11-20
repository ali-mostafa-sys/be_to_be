


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class AddCompanyUseCase {
  final CompanyInfoRepositories companyInfoRepositories;
  const AddCompanyUseCase({required this.companyInfoRepositories});
  Future<Either<Failure,Unit>>call(AddCompanyEntity addCompanyEntity)async{
    return await companyInfoRepositories.postAddCompany(addCompanyEntity);
  }
}