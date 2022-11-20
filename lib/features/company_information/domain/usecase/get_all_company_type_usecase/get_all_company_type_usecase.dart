

// class GetNotificationsUseCase{
//   final WheelRepository wheelRepository;
//   const GetNotificationsUseCase({required this.wheelRepository});
//   Future <Either<Failure,NotificationsEntity>>call(String token)async{
//     return await wheelRepository.getNotifications(token);
//   }
// }


import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/all_company_type_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllCompanyTypeUseCase{
  final CompanyInfoRepositories companyInfoRepositories;
  const GetAllCompanyTypeUseCase({required this.companyInfoRepositories});

  Future <Either<Failure,AllCompanyTypeEntity>>call()async{
    return await companyInfoRepositories.getAllCompanyType();
  }
}