import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable{
  final int idUser;
  final String firstName;
  final String lastName;
  final String email;
  final String roleId;
  const LoginResponseEntity({
   required this.idUser,
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.roleId,
});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}