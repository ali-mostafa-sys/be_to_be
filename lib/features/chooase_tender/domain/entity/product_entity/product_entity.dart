


import 'package:equatable/equatable.dart';

class ProductChooseTenderEntity extends Equatable{
  final int idProduct;
  final int brandId;
  final String nameEn;
  const ProductChooseTenderEntity({
    required this.idProduct,
    required this.brandId,
    required this.nameEn,
});
  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idProduct,brandId];

}