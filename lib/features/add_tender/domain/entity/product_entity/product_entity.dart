

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  final String nameEn;
  final int idProduct;
  const ProductEntity({required this.nameEn,required this.idProduct});
  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idProduct];

}