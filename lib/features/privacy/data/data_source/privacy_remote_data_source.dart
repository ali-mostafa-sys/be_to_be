


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/privacy/data/models/privacy_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrivacyRemoteDataSource{

  Future<PrivacyModel>getPrivacy();

}


class PrivacyRemoteDataSourceImpl extends PrivacyRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  PrivacyRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client
});

  @override
  Future<PrivacyModel> getPrivacy()async {
    final uri = Uri.http(baseUrl, '/api/user/privacy-policy');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final privacy=PrivacyModel.fromJson(data[0]);
      return privacy;

    }else{
      throw ServerException();
    }
  }


}
