

import 'package:equatable/equatable.dart';

class CategoriesChooseTenderEntity extends Equatable{

  final int idCategory;
  final String nameEn;
  const CategoriesChooseTenderEntity({
    required this.nameEn,
    required this.idCategory,
});



  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idCategory];
}