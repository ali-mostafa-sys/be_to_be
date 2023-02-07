
import 'package:equatable/equatable.dart';

class GetAllTenderEntity extends Equatable{

  final int tenderId;
  final int creatorScore;
  final String productName;
  final String? productImgUrl;
  final String brandName;
  final String categoryName;
  final String status;
  final String from;
  final String? area;
  final String to;
  final String deliverBefore;
  const GetAllTenderEntity({
    required this.tenderId,
    required this.creatorScore,
    required this.productName,
     this.productImgUrl,
     this.area,
    required this.brandName,
    required this.categoryName,
    required this.status,
    required this.from,
    required this.to,
    required this.deliverBefore,
});


  @override
  // TODO: implement props
  List<Object?> get props => [tenderId,productName,productImgUrl,brandName,categoryName,status,from,to,deliverBefore,creatorScore,area];


}