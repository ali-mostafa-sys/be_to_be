// {
// "allCount": 3,
// "data": [
// {
// "idCompanyType": 1,
// "nameEn": "IT",
// "descriptionEn": "ITE"
// },
// ]
// }

import 'package:equatable/equatable.dart';

class CompanyTypeEntity extends Equatable{
  final int companyTypeId;
  final String companyType;
  const CompanyTypeEntity({required this.companyTypeId,required this.companyType});
  @override

  List<Object?> get props => [companyTypeId,companyType];

}

class AllCompanyTypeEntity extends Equatable{
  final int allCount;
  final List<CompanyTypeEntity> data;
  const AllCompanyTypeEntity({required this.allCount,required this.data});

  @override

  List<Object?> get props => [allCount,data];

}