import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';

class GetAllTenderModel extends GetAllTenderEntity{
  // final String productName;
  // final String productImgUrl;
  // final String brandName;
  // final String categoryName;
  // final String status;
const  GetAllTenderModel({
    required int tenderId,
    required int creatorScore,
    required String productName,
     String? productImgUrl,
     String? area,
    required String brandName,
    required String categoryName,
    required String status,
    required String from,
    required String to,
    required String deliverBefore,
}):super(tenderId: tenderId,productImgUrl: productImgUrl,categoryName: categoryName,brandName: brandName,productName: productName,status: status,
from: from,to: to,deliverBefore: deliverBefore,creatorScore: creatorScore,area: area);


  factory GetAllTenderModel.fromJson(Map<String,dynamic>json){
    final tenderId=json['idTender'];
    final productName=json['productName'];
    final productImgUrl=json['productImgUrl'];
    final brandName=json['brandName'];
    final categoryName=json['categoryName'];
    final status=json['status'];
    final from=json['from'];
    final to=json['to'];
    final area=json['area'];
    final deliverBefore=json['deliverBefore'];
    final creatorScore=json['creatorScore'];

    return GetAllTenderModel(tenderId: tenderId,
        productName: productName, productImgUrl: productImgUrl, brandName: brandName, categoryName: categoryName, status: status,
    from: from,to: to,deliverBefore: deliverBefore,creatorScore: creatorScore,area: area);

  }


}