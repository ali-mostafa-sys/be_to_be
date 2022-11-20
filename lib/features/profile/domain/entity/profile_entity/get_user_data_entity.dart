

import 'package:equatable/equatable.dart';

class GetUserDataEntity extends Equatable{

  final String firstName;
  final String lastName;
  final String email;
  final String? mobile;
  final String? password;
  final String? birthDate;

  const GetUserDataEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.mobile,
    this.password,
    this.birthDate,

});




  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,mobile,password,birthDate];

}