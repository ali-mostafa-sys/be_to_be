

import 'package:be_to_be/features/home/domain/entiy/package_used_entity/package_used_entity.dart';

class PackageUsedModel extends PackageUsedEntity{

  PackageUsedModel({
    required String subscriptionPackageName,
    required String expireAt,
    required int isActive,
    required int monthAllowTenderCnt,
    required int monthCreatTenderCnt,
    required int dayAllowTenderCnt,
    required int dayCreatTenderCnt,
}):super(subscriptionPackageName: subscriptionPackageName ,
  expireAt: expireAt,
      isActive: isActive,monthAllowTenderCnt: monthAllowTenderCnt,monthCreatTenderCnt: monthCreatTenderCnt,dayAllowTenderCnt: dayAllowTenderCnt,dayCreatTenderCnt: dayCreatTenderCnt
  );
  factory PackageUsedModel.fromJson(Map<String,dynamic>json){
    final subscriptionPackageName=json['subscriptionPackageName'];
    final expireAt=json['expirAt'];
    final isActive=json['isActive'];
    final monthAllowTenderCnt=json['monthAllowTenderCnt'];
    final monthCreatTenderCnt=json['monthCreatTenderCnt'];
    final dayAllowTenderCnt=json['dayAllowTenderCnt'];
    final dayCreatTenderCnt=json['dayCreatTenderCnt'];
    return PackageUsedModel(subscriptionPackageName: subscriptionPackageName,monthAllowTenderCnt: monthAllowTenderCnt,
        monthCreatTenderCnt: monthCreatTenderCnt  ,dayAllowTenderCnt: dayAllowTenderCnt,dayCreatTenderCnt: dayCreatTenderCnt,

        expireAt: expireAt,
        isActive: isActive);



  }


}