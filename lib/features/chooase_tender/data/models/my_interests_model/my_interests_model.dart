import 'package:be_to_be/features/chooase_tender/domain/entity/my_interests_entity/my_interests_entity.dart';

class MyInterestsModel extends MyInterestsEntity {
const  MyInterestsModel(
      {required String? categoryName,
      required String? brandName,
      required String? productName})
      : super(
            categoryName: categoryName,
            brandName: brandName,
            productName: productName);


factory MyInterestsModel.fromJson(Map<String,dynamic>json){
  final categoryName=json['categoryName'];
  final brandName=json['brandName'];
  final productName=json['productName'];
  return MyInterestsModel(categoryName: categoryName, brandName: brandName, productName: productName);

}
}
