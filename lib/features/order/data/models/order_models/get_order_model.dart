
import 'package:be_to_be/features/order/domain/entity/order_entity/get_orders_entity.dart';

class GetOrderModel extends GetOrderEntity{

 // final int tenderId;
//  final String productName;
 // final String brandName;
  //final String categoryName;
 // final String productImgUrl;
 // final String area;
 // final String street;
 // final String deliverBefore;
 // final String closedAt;
  // final int productId;
 // final int quantity;




  const GetOrderModel({
    required int tenderId,
    required String productName,
    required String brandName,
    required String categoryName,
    required String status,
     String? productImgUrl,
     String? area,
     String? street,
    required String deliverBefore,
     String? closedAt,
    required int quantity,
    required int creatorScore,
    required String from,
    required String to,


}):super(tenderId: tenderId,
    productName: productName,
    creatorScore: creatorScore,
    brandName: brandName,
    categoryName: categoryName,
    productImgUrl: productImgUrl,
    status: status,
    area: area,
    street: street,
    deliverBefore: deliverBefore,
  closedAt: closedAt,
    quantity: quantity,
    from: from,
    to: to,

  );


  factory GetOrderModel.fromJson(Map<String,dynamic>json){
   final tenderId=json['idTender'];
   final productName=json['productName'];
   final brandName=json['brandName'];
   final categoryName=json['categoryName'];
   final productImgUrl=json['productImgUrl'];
   final area=json['area'];
   final street=json['street'];
   final deliverBefore=json['deliverBefore'];
   final closedAt=json['closedAt'];
   final quantity=json['quantity'];
   final from=json['from'];
   final to=json['to'];
   final creatorScore=json['creatorScore'];
   final status=json['status'];
   return GetOrderModel(tenderId: tenderId,
       productName: productName,
       brandName: brandName,
       creatorScore: creatorScore,
       categoryName: categoryName,
       productImgUrl: productImgUrl,status: status,
       area: area,
       street: street,
       deliverBefore: deliverBefore, closedAt: closedAt, quantity: quantity,
   from: from,to: to,
   );
  }



}