import 'package:equatable/equatable.dart';

class IsLoggedEntity extends Equatable{
  final String roleId;
  final String firstName;
  final String lastName;
  final String email;
  final int idUser;
  const IsLoggedEntity({required this.roleId,required this.firstName,required this.lastName,required this.email,required this.idUser});
  @override
  // TODO: implement props
  List<Object?> get props => [roleId];

}