



import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/auth/data/models/login_models/login_model.dart';
import 'package:be_to_be/features/auth/data/models/login_models/login_response_model.dart';
import 'package:be_to_be/features/auth/data/models/register_models/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> postLogin(LoginModel loginModel);
  Future<Unit> postRegister(RegisterModel registerModel);
  Future<Unit>getForgetPasswordCode(String email);
  Future<Unit>postNewPassword({required String email,required String password,required String code});


}

class AuthDataSourceImpl extends AuthDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  AuthDataSourceImpl({required this.client,required this.sharedPreferences});

  @override
  Future<LoginResponseModel> postLogin(LoginModel loginModel) async{
    final uri = Uri.http(baseUrl, '/api/auth/login');
    final response = await client.post(uri, body: loginModel.toJson(),headers: {"Accept":"application/json"});
    print(response.headers);
    await sharedPreferences.setString('cookies', response.headers['set-cookie'].toString());

    if (response.statusCode == 200) {
     final data= jsonDecode(response.body);
     await sharedPreferences.remove('companyIsComplete');
     await sharedPreferences.remove('registerIsComplete');
     await sharedPreferences.remove('verificationIsComplete');
     await sharedPreferences.remove('companyInformation');
     await sharedPreferences.remove('companyId');



     final loginResponseModel=LoginResponseModel.fromJson(data);
     await sharedPreferences.setString('notes', loginResponseModel.notes.toString());
    if(loginResponseModel.isAccepted==0){
      if(loginResponseModel.notes!=null){

        throw GoToProfileException();
      }
      throw UnAcceptedAccountException();
    }

    // await sharedPreferences.remove('email');
   //  await sharedPreferences.remove('password');
     await sharedPreferences.setString('password',loginModel.password.toString());
     await sharedPreferences.setString('email',loginModel.email.toString());

      return loginResponseModel;
    } else if(response.statusCode == 401) {
      final message = jsonDecode(response.body);
      if (message['error']['message'] == "InvalidLogin") {
        throw InvalidEmailAndPasswordException();
      }
      if(message['error']['code'] == "InactiveAccount") {
        throw AccountNotVerificationException();
      }
      if(message['error']['code'] == "UnAcceptedAccount") {
        throw UnAcceptedAccountException();
      }

      else{
        throw ServerException();
      }
    }
    else
      {
      throw ServerException();
    }
  }

  @override
  Future<Unit> postRegister(RegisterModel registerModel)async {
    final uri = Uri.http(baseUrl, '/api/auth/signup');
    final response = await client.post(uri, body: registerModel.toJson()
        ,headers: {
      "Accept":"application/json",
        });
   print(response.statusCode);
   print(response.body);
   print(registerModel.toJson());
    if (response.statusCode == 200) {
     await sharedPreferences.setBool('registerIsComplete', true);
      return Future.value(unit);
    } else if(response.statusCode == 409){
     // print('409');
      throw DuplicateUserException();

    }else if(response.statusCode == 400){
     // print('400');
      throw InvalidEmailException();
    }
    else
    {
      throw ServerException();
    }
  }

  ///
/// here for cookies
///

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      response. headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
///
  /// here for get code of forget password
  ///
  @override
  Future<Unit> getForgetPasswordCode(String email)async {
    final uri = Uri.http(baseUrl, '/api/auth/code/reset-password/generate');
    Map<String,String>body={
      "loginName":email.toString()
    };
    final response = await client.post(uri, headers: {
          "Accept":"application/json",
        },
      body: body
        );
    print(response.body);
    print(response.statusCode);

    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();

    }
  }

  ///
  /// here for post new password
  ///
  @override
  Future<Unit> postNewPassword({required String email, required String password, required String code})async {
    final uri = Uri.http(baseUrl, '/api/auth/reset-password');
    Map<String,String>body={
      "loginName":email.toString(),
      "code":code.toString(),
      "newPassword":password.toString(),
    };
    final response = await client.post(uri, headers: {
      "Accept":"application/json",
    },
        body: body
    );

    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();

    }
  }

}
