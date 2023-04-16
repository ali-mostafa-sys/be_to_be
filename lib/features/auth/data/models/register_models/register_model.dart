

import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';

class RegisterModel extends RegisterEntity{
  const RegisterModel({
    required String firstName,
    required String lastName,
    required String email,
    required String mobileNumber,
    required String password,
    required String birthDate ,
    required String gender ,
    required String companyId ,
    required bool hasMobileWhatsApp,
}):super(
    firstName: firstName,
    lastName: lastName,
    email: email,
    mobileNumber: mobileNumber,
    password: password,
    birthDate: birthDate,
    gender: gender,
    companyId: companyId,
    hasMobileWhatsApp: hasMobileWhatsApp,
  );
  factory RegisterModel.fromJson(Map<String,dynamic>json){
    final firstName=json['firstName'];
    final lastName=json['lastName'];
    final email=json['email'];
    final mobileNumber=json['mobile'];
    final password=json['password'];
    final birthDate=json['birthDate'];
    final gender=json['gender'];
    final companyId=json['companyId'];
    final hasMobileWhatsApp=json['hasMobileWhatsapp'];
    return RegisterModel(firstName: firstName,
        lastName: lastName,
        email: email,
        companyId: companyId,
        mobileNumber: mobileNumber, password: password, birthDate: birthDate, gender: gender, hasMobileWhatsApp: hasMobileWhatsApp);
  }


  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobileNumber,
      'password': password,
      'birthDate': birthDate,
      'gender': gender,
      'companyId': companyId,
      'hasMobileWhatsapp': hasMobileWhatsApp.toString() ,
    };
  }

}