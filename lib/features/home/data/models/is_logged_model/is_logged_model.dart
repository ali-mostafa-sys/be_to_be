

import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';

class IsLoggedModel extends IsLoggedEntity{
  const IsLoggedModel({
    required String roleId,
    required String firstName,
    required String lastName,
    required String email,
}):super(roleId: roleId,firstName: firstName,lastName: lastName,email: email);

  factory IsLoggedModel.fromJson(Map<String,dynamic>json){

    final roleId=json['roleId'];
    final firstName=json['firstName'];
    final lastName=json['lastName'];
    final email=json['email'];
    return IsLoggedModel(roleId: roleId,firstName: firstName,lastName: lastName,email: email);
  }
}