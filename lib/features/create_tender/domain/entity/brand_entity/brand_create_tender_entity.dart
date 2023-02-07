


import 'package:equatable/equatable.dart';

class BrandCreateTenderEntity extends Equatable{

  final int idBrand;
  final String nameEn;

  const BrandCreateTenderEntity({
    required this.idBrand,
    required this.nameEn
  });

  @override
  // TODO: implement props
  List<Object?> get props => [idBrand,nameEn];

}