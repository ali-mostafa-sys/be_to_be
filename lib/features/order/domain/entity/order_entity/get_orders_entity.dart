

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
  final String from;
  final String to;
  final int tenderId;
  final int creatorScore;
  final String productName;
  final String brandName;
  final String name;
  final String categoryName;
  final String? productImgUrl;
  final String? area;
  final String? street;
  final String deliverBefore;
  final String? closedAt;
  final String? status;
  // final int productId;
  final int quantity;

  const GetOrderEntity({
    required this.tenderId,
    required this.productName,
    required this.brandName,
    required this.name,
    required this.categoryName,
    required this.status,
     this.productImgUrl,
     this.area,
     this.street,
    required this.deliverBefore,
     this.closedAt,
    required this.quantity,
    required this.from,
    required this.to,
    required this.creatorScore,
});



  @override
  // TODO: implement props
  List<Object?> get props => [name,tenderId,status,productName,brandName,categoryName,productImgUrl,area,street,deliverBefore,closedAt,quantity,from,to,creatorScore];

}