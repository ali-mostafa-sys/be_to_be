

import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/upgrade/data/models/subscribe_model/subscribe_model.dart';
import 'package:be_to_be/features/upgrade/data/models/upgrade_models/upgrade_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class UpgradeRemoteDataSource {

  Future<List<UpgradeModel>>getAllPackage();
  Future<int>postSubscribe(SubscribeModel subscribeModel);
}

class UpgradeRemoteDataSourceImpl extends UpgradeRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;

   UpgradeRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
});

  ///
  /// here for get all package data
  ///
  @override
  Future<List<UpgradeModel>> getAllPackage()async {
    final url = 'http://${baseUrl}/api/user/subscription/packages';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
   if(response.statusCode==200){
     final allData=jsonDecode(response.body);
     final listData=allData['data'] as List;
     print(listData);
     final upgradeModel=listData.map((e) {
       return UpgradeModel.fromJson(e);
     }).toList();
     return upgradeModel;
   }else{
     throw ServerException();
   }
  }
///
  /// here for post subscribe
  ///
  @override
  Future<int> postSubscribe(SubscribeModel subscribeModel)async {
    final url=Uri.http(baseUrl,'/api/user/subscription/subscribe');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(url, headers: {
      "Accept": "application/json",
      "Cookie": "$cookies"
    },
      body: subscribeModel.toJson(),
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      print(data['subscriptionId']);


      return data['subscriptionId'];
    }else{
      throw ServerException();
    }
  }

}