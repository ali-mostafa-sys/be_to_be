import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';

class GetUserDataModel extends GetUserDataEntity{
 const GetUserDataModel({
   required String firstName,
   required String lastName,
   required String email,
   String? mobile,
   String? password,
   String? birthDate,
 }) : super(firstName: firstName, lastName: lastName, email: email,mobile: mobile,password: password,birthDate: birthDate);

 factory GetUserDataModel.fromJson(Map<String,dynamic>json){
   final firstName=json['firstName'];
   final lastName=json['lastName'];
   final email=json['email'];
   final mobile=json['mobile'];
   final password=json['password'];
   final birthDate=json['birthDate'];
   return GetUserDataModel(firstName: firstName, lastName: lastName, email: email,mobile: mobile,password: password,birthDate: birthDate);
 }
 Map<String,dynamic>toJson(){
   return {
     "firstName":firstName,
     "lastName":lastName,
     "email":email,
     "mobile":mobile,
     "password":password,
     "birthDate":birthDate,
   };
 }

}