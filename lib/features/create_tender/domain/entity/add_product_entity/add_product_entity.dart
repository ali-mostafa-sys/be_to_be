


import 'package:equatable/equatable.dart';

class AddProductEntity extends Equatable{
  final String nameEn;
  final String descriptionEn;
  final String imgUrl;
  final int brandId;
  const AddProductEntity({
    required this.nameEn,
    required this.descriptionEn,
    required this.imgUrl,
    required this.brandId,
});

  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,descriptionEn,imgUrl,brandId];

}