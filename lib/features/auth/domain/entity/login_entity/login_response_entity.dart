import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable{
  final int idUser;
  final String firstName;
  final String lastName;
  final String email;
  final String roleId;
  final String? notes;
  final int isAccepted;
  const LoginResponseEntity({
   required this.idUser,
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.roleId,
   required this.notes,
   required this.isAccepted,
});


  @override
  // TODO: implement props
  List<Object?> get props => [idUser,firstName,lastName,email,roleId,notes,isAccepted];

}