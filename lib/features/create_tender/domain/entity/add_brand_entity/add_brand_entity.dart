

import 'package:equatable/equatable.dart';

class AddBrandEntity extends Equatable{

  final String nameEn;
  final String descriptionEn;
  final int categoryId;
  const AddBrandEntity({
    required this.nameEn,
    required this.descriptionEn,
    required this.categoryId,
});


  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,descriptionEn,categoryId];


}



