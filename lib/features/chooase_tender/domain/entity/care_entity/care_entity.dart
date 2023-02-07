


import 'package:equatable/equatable.dart';



class DataEntity extends Equatable{

  final List<int>? categoryEntity;
  final List<int>? brandEntity;
  final List<int>? productEntity;

  const DataEntity({

    this.categoryEntity,
    this.brandEntity,
     this.productEntity,
});



  @override
  // TODO: implement props
  List<Object?> get props => [categoryEntity,brandEntity,productEntity];


}

