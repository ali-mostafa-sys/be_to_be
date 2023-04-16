


import 'package:equatable/equatable.dart';

class BrandCreateTenderEntity extends Equatable{

  final int categoryId;
  final int idBrand;
  final String nameEn;

  const BrandCreateTenderEntity({
    required this.idBrand,
    required this.categoryId,
    required this.nameEn
  });

  @override
  // TODO: implement props
  List<Object?> get props => [idBrand,nameEn];

}