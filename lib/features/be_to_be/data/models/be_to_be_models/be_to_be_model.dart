


import 'package:be_to_be/features/be_to_be/domain/entity/be_to_be_entity/be_to_be_entity.dart';

class BeToBeModel extends BeToBeEntity{

   BeToBeModel({
     required String firstName
}):super(firstName: firstName);



  factory BeToBeModel.fromJson(Map<String,dynamic>json){
   final firstName=json['firstName'];
    return BeToBeModel(firstName:firstName );
  }


}