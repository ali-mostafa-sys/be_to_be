import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  final String email;
  final String password;
  final String notificationToken;

  const LoginEntity({required this.email,required this.password,required this.notificationToken});


  @override
  // TODO: implement props
  List<Object?> get props => [email,password,notificationToken];

}