import 'package:equatable/equatable.dart';

class MyInterestsEntity extends Equatable {
  final String? categoryName;
  final String? brandName;
  final String? productName;

const  MyInterestsEntity({required this.categoryName,required this.brandName,required this.productName});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryName,brandName,productName];
}
