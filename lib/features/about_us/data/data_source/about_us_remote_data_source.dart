


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/about_us/data/models/about_us_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AboutUsRemoteDataSource {

  Future <List<AboutUsModel>>getAboutUs();
}


class AboutUsRemoteDataSourceImpl extends AboutUsRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;

  AboutUsRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client
});


  @override
  Future<List<AboutUsModel>> getAboutUs() async{
    final uri = Uri.http(baseUrl, '/api/user/aboutus');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final aboutUs=data.map((e) =>AboutUsModel.fromJson(e) ).toList();
      return aboutUs;

    }else{
      throw ServerException();
    }
  }

}