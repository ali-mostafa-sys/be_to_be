

import 'package:equatable/equatable.dart';


// {
/// "idTender": 3,



/// "productName": "iphone 7",
/// "productImgUrl": null,
/// "brandName": "apple",
/// "categoryName": "mobile",
/// "quantity": 50,
// "from": "2022-09-24T05:38:00.000Z",
// "to": "2022-10-10T05:39:00.000Z",
/// "deliverBefore": "2022-09-14T05:38:00.000Z",
/// "area": "dubai",
/// "street": "sooq alkaber",
/// "closedAt": "2022-09-06T05:38:00.000Z"
// },


class GetOrderEntity extends Equatable{
  final int tenderId;
  final String productName;
  final String brandName;
  final String categoryName;
  final String? productImgUrl;
  final String? area;
  final String? street;
  final String deliverBefore;
  final String? closedAt;
  // final int productId;
  final int quantity;

  const GetOrderEntity({
    required this.tenderId,
    required this.productName,
    required this.brandName,
    required this.categoryName,
     this.productImgUrl,
     this.area,
     this.street,
    required this.deliverBefore,
     this.closedAt,
    required this.quantity,
});



  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,productName,brandName,categoryName,productImgUrl,area,street,deliverBefore,closedAt,quantity];

}