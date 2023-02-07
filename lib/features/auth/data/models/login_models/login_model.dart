import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';

class LoginModel extends LoginEntity{

  const LoginModel({
    required String email,
    required String password,
    required String notificationToken,
}):super(email: email,password: password,notificationToken: notificationToken);

  factory LoginModel.formJson(Map<String,dynamic>json){
    final email =json['loginName'];
    final password =json['password'];
    final notificationToken =json['notificationToken'];
    return LoginModel(email: email, password: password,notificationToken: notificationToken);
  }
  Map<String, dynamic> toJson() {
    return {
      'loginName': email,
      'password': password,
      'notificationToken': notificationToken,
    };
  }


}