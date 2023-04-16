import 'package:be_to_be/features/auth/domain/entity/login_entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
   LoginResponseModel({
    required int idUser,
    required String firstName,
    required String lastName,
    required String email,
    required String roleId,
    required String? notes,
     required int isAccepted,
  }) : super(
            idUser: idUser,
            firstName: firstName,
            lastName: lastName,
            email: email,
            roleId: roleId,isAccepted: isAccepted,notes: notes,
   );

  factory LoginResponseModel.fromJson(Map<String,dynamic>json){
    final idUser=json['idUser'];
    final firstName=json['firstName'];
    final lastName=json['lastName'];
    final email=json['email'];
    final roleId=json['roleId'];
    final notes=json['notes'];
    final isAccepted=json['isAccepted'];
    return LoginResponseModel(idUser: idUser,
        firstName: firstName,
        lastName: lastName, email: email, roleId: roleId,notes: notes,isAccepted: isAccepted);
  }
}
