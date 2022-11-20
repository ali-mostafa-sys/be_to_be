


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/home/data/models/is_logged_model/is_logged_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainRemoteDataSource{

  Future<IsLoggedModel>getIsLogged();

}
class MainRemoteDataSourceImpl extends MainRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
   MainRemoteDataSourceImpl({required this.client,required this.sharedPreferences});



  ///
  /// here for get is logged data
  ///
  @override
  Future<IsLoggedModel> getIsLogged()async {

   final url='http://167.235.141.213/api/auth/is_loggedin';
   final cookies= sharedPreferences.getString('cookies');

   final response=await client.get(Uri.parse(url),headers: {"Accept":"application/json","Content-Type":"application/json","Cookie":"$cookies"});


   print(url);
   print(response.statusCode);

   if(response.statusCode==200){
     final allData = jsonDecode(response.body);
     print(allData);
     final data =allData["user"];
     print(data);
     if(data ==null){
       throw ServerException();
     }else{
       final isLoggedModel=IsLoggedModel.fromJson(data);
       return isLoggedModel;
     }



   }else{
     throw ServerException();
   }



  }

}






