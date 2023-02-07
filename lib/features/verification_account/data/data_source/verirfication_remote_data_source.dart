import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class VerificationRemoteDataSource {
  Future<Unit> postVerificationCode(String loginName);
  Future<Unit>getVerificationCode(String loginName,String code);
}

class VerificationRemoteDataSourceImpl extends VerificationRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  VerificationRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
  });

  ///
  /// here for get verification code
  ///
  @override
  Future<Unit> postVerificationCode(String loginName) async {
    Map<String, dynamic> data = {"loginName": loginName.toString()};
    final body = jsonEncode(data);
    print('=======================================');
    print(body);
    print('=======================================');
    final uri = Uri.http(baseUrl,'/api/auth/code/activate/generate');

    final response = await client.post(uri,
        headers: {
          "Accept": "application/json",
        },
        body: {"loginName": loginName.toString()}
        );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }

  @override
  Future<Unit> getVerificationCode(String loginName, String code)async {
    final queryParameters = {
      "loginName": loginName.toString(),
      "code": code.toString(),
    };
    final uri = Uri.http(baseUrl, '/api/auth/activate/',queryParameters,);
    final url='http://${baseUrl}/api/auth/activate/:$loginName/:$code';
    print(url);
    print(uri);
    final response = await client.get(
      Uri.parse(url),
      headers: {"Accept":"application/json",
        //"Content-Type":"application/json"

      },
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      await sharedPreferences.setBool('verificationIsComplete', true);
      return Future.value(unit);
    }else if(response.statusCode==409){

      throw VerificationConflictException();
    }else{

      throw ServerException();
    }
  }

}
