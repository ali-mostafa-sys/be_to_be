


import 'package:equatable/equatable.dart';

class CategoriesCreateTenderEntity extends Equatable{

  final int idCategory;
  final String nameEn;
  const CategoriesCreateTenderEntity({
    required this.nameEn,
    required this.idCategory,
  });



  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idCategory];
}