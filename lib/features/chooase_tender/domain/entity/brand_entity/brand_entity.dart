

import 'package:equatable/equatable.dart';

class BrandChooseTenderEntity extends Equatable{

  final int idBrand;
  final int categoryId;
  final String nameEn;

  const BrandChooseTenderEntity({
    required this.idBrand,
    required this.categoryId,
    required this.nameEn
});

  @override
  // TODO: implement props
  List<Object?> get props => [idBrand,nameEn,categoryId];

}