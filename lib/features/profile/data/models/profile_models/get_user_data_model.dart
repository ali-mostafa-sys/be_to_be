import 'package:be_to_be/features/profile/domain/entity/profile_entity/get_user_data_entity.dart';

class GetUserDataModel extends GetUserDataEntity{
 const GetUserDataModel({
   required String firstName,
   required String lastName,
   required String email,
   String? mobile,
   String? password,
   String? birthDate,
   /// here for company info
    String? companyName,
   required int companyId,
    String? establishDate,
    String? companyType,
    String? licenseNumber,
    String? licenseExpireDate,
    String? imgUrl,
 }) : super(firstName: firstName, lastName: lastName, email: email,mobile: mobile,password: password,birthDate: birthDate,companyName: companyName,establishDate: establishDate,
 companyType: companyType,licenseNumber: licenseNumber,licenseExpireDate: licenseExpireDate,imgUrl: imgUrl,companyId: companyId);

 factory GetUserDataModel.fromJson(Map<String,dynamic>json){
   final firstName=json['firstName'];
   final lastName=json['lastName'];
   final email=json['email'];
   final mobile=json['mobile'];
   //final password=json['password'];
   final birthDate=json['birthDate'];
   final companyName=json['companyName'];
   final establishDate=json['establish_at'];
   /// here to edit ////////////////////////////////////////////////////////////
   final companyType=json['companyTypeName'];
   final companyId=json['companyId'];
   final licenseNumber=json['license_number'];
   final licenseExpireDate=json['license_expir_at'];
   final imgUrl=json['licenseImgUrl'];
   return GetUserDataModel(firstName: firstName, lastName: lastName, email: email,mobile: mobile,
    // password: password,
     birthDate: birthDate,
   companyId: companyId,
   companyName: companyName,establishDate: establishDate,companyType: companyType,licenseNumber: licenseNumber,licenseExpireDate: licenseExpireDate,
     imgUrl: imgUrl,
   );
 }
 Map<String,dynamic>toJson(){
   if(password==null){
     return {
       "firstName":firstName,
       "lastName":lastName,
       "email":email,
       "mobile":mobile,
       "birthDate":birthDate,
       /// here for company info
       "companyName":companyName,
       "idCompany":companyId.toString(),
       "establish_at":establishDate,
       "companyTypeName":companyType,
       "license_number":licenseNumber,
       "license_expir_at":licenseExpireDate,
       "licenseImgUrl":imgUrl,
     };
   }
   return {
     "firstName":firstName,
     "lastName":lastName,
     "email":email,
     "mobile":mobile,
     "password":password,
     "birthDate":birthDate,
     /// here for company info
     "companyName":companyName,
     "idCompany":companyId.toString(),
     "establish_at":establishDate,
     "companyTypeName":companyType,
     "license_number":licenseNumber,
     "license_expir_at":licenseExpireDate,
     "licenseImgUrl":imgUrl,
   };
 }

}