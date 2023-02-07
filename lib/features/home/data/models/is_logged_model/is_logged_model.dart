

import 'package:be_to_be/features/home/domain/entiy/is_logged_entity/is_logged_entity.dart';

class IsLoggedModel extends IsLoggedEntity{
  const IsLoggedModel({
    required String roleId,
    required String firstName,
    required String lastName,
    required String email,
    required int idUser,
}):super(roleId: roleId,firstName: firstName,lastName: lastName,email: email,idUser: idUser);

  factory IsLoggedModel.fromJson(Map<String,dynamic>json){

    final roleId=json['roleId'];
    final firstName=json['firstName'];
    final lastName=json['lastName'];
    final email=json['email'];
    final idUser=json['idUser'];
    return IsLoggedModel(roleId: roleId,firstName: firstName,lastName: lastName,email: email,idUser: idUser);
  }
}