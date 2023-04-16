


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class LauncherRemoteDataSource{

  Future<Unit>getCities();


}

class LauncherRemoteDataSourceImpl extends LauncherRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  LauncherRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
});





  @override
  Future<Unit> getCities()async   {
    final uri = Uri.http(baseUrl, '/api/public/cities',);
    final response = await client.get(
      uri,
      headers: {"Accept":"application/json",
        //"Content-Type":"application/json"

      },
    );
    if(response.statusCode==200){
      // print('==============================');
      // print(response.body.runtimeType);
      // print('==============================');
      //
      // final allData=jsonDecode(response.body);
      // final data = jsonEncode(allData);
      // print(data);
      sharedPreferences.setString('cities', response.body);

      return Future.value(unit);

    }else{
      throw ServerException();

    }
  }

}
