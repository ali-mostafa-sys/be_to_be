


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/contact_us/data/models/contact_us_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContactUsRemoteDataSource {

  Future<ContactUsModel>getContactUs();


}


class ContactUsRemoteDataSourceImpl extends ContactUsRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;


   ContactUsRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
});


  @override
  Future<ContactUsModel> getContactUs()async {
    final uri = Uri.http(baseUrl, '/api/user/contact-info');
    print(uri);
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final contactUs=ContactUsModel.fromJson(data[0]);
      return contactUs;


    }else{
      throw ServerException();
    }
  }



}