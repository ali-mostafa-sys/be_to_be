



import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/be_to_be/data/models/be_to_be_models/be_to_be_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BeToBeDataSource{

  Future<List<BeToBeModel>>getBeToBeData();
}


class BeToBeDataSourceImpl extends BeToBeDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;

   BeToBeDataSourceImpl({required this.client,required this.sharedPreferences});



  ///
  /// here for get all data
  ///
  @override
  Future<List<BeToBeModel>> getBeToBeData()async {
    final uri=Uri.http(baseUrl, '/api/user/tenders/B2B');
    final cookies=sharedPreferences.getString('cookies');
    final response=await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type":"application/json","Cookie":"$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data= allData['data'] as List;
      if(data.isEmpty){
        throw  TenderIsEmptyException();
      }else{
        final listData=data.map((e) {
          return BeToBeModel.fromJson(e);
        }).toList();
        return listData;
      }

    }else{
      throw ServerException();
    }
  }

}

