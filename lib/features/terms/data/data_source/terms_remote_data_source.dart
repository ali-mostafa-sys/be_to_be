


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/terms/data/models/terms_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class TermsRemoteDataSource {


  Future<TermsModel>getTerms();

}



class TermsRemoteDataSourceImpl extends TermsRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences ;
  TermsRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
});




  @override
  Future<TermsModel> getTerms()async {
    final uri = Uri.http(baseUrl, '/api/user/terms');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final terms=TermsModel.fromJson(data[0]);
      return terms;

    }else{
      throw ServerException();
    }
  }

}