


import 'package:be_to_be/features/company_information/domain/entity/all_company_type_entity.dart';

class CompanyTypeModel extends CompanyTypeEntity{

  const CompanyTypeModel({
    required int companyTypeId,
    required String companyType,
}):super(companyTypeId: companyTypeId,companyType: companyType);

  factory CompanyTypeModel.fromJson(Map<String,dynamic>json){
  final  companyTypeId=json['idCompanyType'];
  final  companyType=json['nameEn'];
  return CompanyTypeModel(companyTypeId: companyTypeId, companyType: companyType);
  }

}

class AllCompanyTypeModel extends AllCompanyTypeEntity{
  const AllCompanyTypeModel({
    required int allCount,
    required List<CompanyTypeModel> data,
}):super(allCount: allCount,data:data );

  factory AllCompanyTypeModel.fromJson(Map<String,dynamic>json){
    final allCount=json['allCount'];
    final listData =json['data']as List;
    final data = listData.map((e){
     return CompanyTypeModel.fromJson(e);
    }).toList();
    return AllCompanyTypeModel(allCount: allCount, data: data);
  }
}