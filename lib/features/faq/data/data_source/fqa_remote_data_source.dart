


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/faq/data/models/fqa_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class FAQRemoteDataSource{

  Future<List<FQAModel>>getFQA();


}

class FAQRemoteDataSourceImpl extends FAQRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;
  FAQRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
});

  @override
  Future<List<FQAModel>> getFQA() async{
    final uri = Uri.http(baseUrl, '/api/user/faqs');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final fqa=data.map((e) {
        return  FQAModel.fromJson(e);
      } ).toList();
      return fqa;

    }else{
      throw ServerException();
    }
  }




}

