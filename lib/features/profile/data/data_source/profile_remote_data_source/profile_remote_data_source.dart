

import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/features/profile/data/models/profile_models/get_user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/strings/const.dart';

abstract class ProfileRemoteDataSource{
  Future<GetUserDataModel>getUserData();
  Future<Unit>postUserData(GetUserDataModel userDataModel);

}


class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;


   ProfileRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
});

  /// here for get user data
  @override
  Future<GetUserDataModel> getUserData() async{
    final url='http://167.235.141.213/api/auth/is_loggedin';
    final cookies= sharedPreferences.getString('cookies');
    final response=await client.get(Uri.parse(url),headers: {"Accept":"application/json","Content-Type":"application/json","Cookie":"$cookies"});
    if(response.statusCode==200){
      final allData = jsonDecode(response.body);
      print(allData);
      final data =allData["user"];
      print(data);
      if(data ==null){
        throw ServerException();
      }else{
        final userDataModel=GetUserDataModel.fromJson(data);
        return userDataModel;
      }
    }else{
      throw ServerException();
    }
  }
/// here for edit user data
  @override
  Future<Unit> postUserData(GetUserDataModel userDataModel) async{
    final uri=Uri.http(baseUrl, 'unencodedPath');
    final cookies= sharedPreferences.getString('cookies');
    final response= await client.post(uri
        ,headers: {"Accept":"application/json","Content-Type":"application/json","Cookie":"$cookies"},
        body: userDataModel.toJson());
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }


}