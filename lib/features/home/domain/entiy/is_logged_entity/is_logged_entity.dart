import 'package:equatable/equatable.dart';

class IsLoggedEntity extends Equatable{
  final String roleId;
  final String firstName;
  final String lastName;
  final String email;
  const IsLoggedEntity({required this.roleId,required this.firstName,required this.lastName,required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [roleId];

}