


import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';

class SubscribeModel extends SubscribeEntity{
  const SubscribeModel({
     String? promotionCode,
    required int subscriptionPackageId,
}):super(subscriptionPackageId: subscriptionPackageId,promotionCode: promotionCode);
  Map<String,dynamic>toJson(){
    if(promotionCode==null){
      return{
        "subscriptionPackageId":subscriptionPackageId.toString(),
      };
    }
    return {
      "subscriptionPackageId":subscriptionPackageId.toString(),
      "promotionCode":promotionCode.toString()

    };
  }
}