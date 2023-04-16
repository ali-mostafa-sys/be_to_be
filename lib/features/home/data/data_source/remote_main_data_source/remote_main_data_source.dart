import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/home/data/models/is_logged_model/is_logged_model.dart';
import 'package:be_to_be/features/home/data/models/package_used_model/package_used_model.dart';
import 'package:be_to_be/features/home/data/models/setting_model/setting_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainRemoteDataSource {
  Future<IsLoggedModel> getIsLogged();

  Future<PackageUsedModel> getPackageUsed();
  Future<List<SettingModel>>getSetting();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  MainRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});

  ///
  /// here for get is logged data
  ///
  @override
  Future<IsLoggedModel> getIsLogged() async {
    final url = 'http://$baseUrl/api/auth/is_loggedin';
    final cookies = sharedPreferences.getString('cookies');

    final response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });

    if (response.statusCode == 200) {
      final allData = jsonDecode(response.body);
      final data = allData["user"];
      if (data == null) {
        throw ServerException();
      } else {
        final isLoggedModel = IsLoggedModel.fromJson(data);
        await sharedPreferences.setString('userId', isLoggedModel.idUser.toString());
        return isLoggedModel;
      }
    } else {
      throw ServerException();
    }
  }

  /// here for get user package used
  @override
  Future<PackageUsedModel> getPackageUsed() async {
    final url = 'http://$baseUrl/api/user/subscription/user-subscriptions';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    print('here body of package');
    print(response.body);
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    print('+++++++++++++++++++++++++++++++++++++++++++++++++');
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'];
      final packageUsedModel=PackageUsedModel.fromJson(data);
      return packageUsedModel;
    }else{
      throw ServerException();
    }


  }
///
  /// here for get setting
  ///
  @override
  Future<List<SettingModel>> getSetting()async {
    final url = Uri.http(baseUrl,'/api/user/settings');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData as List;
      final settings=data.map((e) => SettingModel.fromJson(e)).toList();
      return settings;
    }else{
      throw ServerException();
    }




  }
}
