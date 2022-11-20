import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String password;
  final String birthDate ;
  final String gender ;
  final bool hasMobileWhatsApp;
  const RegisterEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.birthDate,
    required this.gender,
    required this.hasMobileWhatsApp,
});



  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,mobileNumber,password,birthDate,gender,hasMobileWhatsApp];

}