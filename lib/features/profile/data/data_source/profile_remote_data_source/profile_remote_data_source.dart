

import 'dart:convert';
import 'dart:io';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/features/profile/data/models/profile_models/get_user_data_model.dart';
import 'package:be_to_be/features/profile/data/models/upload_image_model/response_upload_profile_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/strings/const.dart';

abstract class ProfileRemoteDataSource{
  Future<GetUserDataModel>getUserData();
  Future<Unit>postUserData(GetUserDataModel userDataModel);
  Future<ResponseUploadProfileImageModel> postUploadProfileImage(File imageFile);

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
    final url='http://91.208.95.203/api/user/profile/info';
    final cookies= sharedPreferences.getString('cookies');
    final response=await client.get(Uri.parse(url),headers: {"Accept":"application/json","Content-Type":"application/json","Cookie":"$cookies"});
    if(response.statusCode==200){
      final allData = jsonDecode(response.body);
      print(allData);
      final data =allData["data"];
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
    final uri=Uri.http(baseUrl, '/api/user/profile/update');
    final cookies= sharedPreferences.getString('cookies');
    final response= await client.post(uri
        ,headers: {"Accept":"application/json",
         // "Content-Type":"application/json",
          "Cookie":"$cookies"},
        body: userDataModel.toJson());
    print(response.body);
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }
///
  /// here for upload profile image and get url
  ///
  @override
  Future<ResponseUploadProfileImageModel> postUploadProfileImage(File imageFile) async{
    final uri = Uri.http(baseUrl, '/api/public/img/upload');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    // request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});

    File _file = File(imageFile.path);
    request.files.add(http.MultipartFile(
        'img', _file.readAsBytes().asStream(), _file.lengthSync(),
        filename: _file.path.split('/').last));

    http.StreamedResponse responsed = await request.send();

    http.StreamedResponse response = responsed;
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
    String message = map["imgUrl"];
    print('Uploaded!');
    //print(message);

    return ResponseUploadProfileImageModel(imageUrl: message);
    } else {
    throw ServerException();
    }
  }


}