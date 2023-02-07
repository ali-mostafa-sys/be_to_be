

import 'dart:convert';
import 'dart:io';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/create_tender/data/models/add_brand_model/add_brand_model.dart';
import 'package:be_to_be/features/create_tender/data/models/add_product_model/add_product_model.dart';
import 'package:be_to_be/features/create_tender/data/models/brand_model/create_tender_brand_model.dart';
import 'package:be_to_be/features/create_tender/data/models/categories_model/create_tender_categories_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateTenderRemoteDataSource {
  Future<List<CategoriesCreateTenderModel>>getCategories();
  Future<List<BrandCreateTenderModel>>getBrands();
  Future<Unit>postAddBrand(AddBrandModel addBrandModel);
  Future<String> postUploadImage(File imageFile);
  Future<Unit>postAddProduct(AddProductModel addProductModel);

}





class CreateTenderRemoteDataSourceImpl extends CreateTenderRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

   CreateTenderRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
});



  ///
  /// here for get categories
  ///
  @override
  Future<List<CategoriesCreateTenderModel>> getCategories()async {
    final uri = Uri.http(baseUrl, '/api/user/categories');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List;
      final categories=data.map((e) => CategoriesCreateTenderModel.fromJson(e)).toList();
      return categories;
    }else{
      throw ServerException();
    }
  }
///
  /// here for get brands
  ///
  @override
  Future<List<BrandCreateTenderModel>> getBrands()async {
    final uri = Uri.http(baseUrl, '/api/user/brands');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List;
      final brands=data.map((e){
        return BrandCreateTenderModel.fromJson(e);
      }).toList();
      return brands;
    }else{
      throw ServerException();
    }
  }
///
  /// here for add new brand
  ///
  @override
  Future<Unit> postAddBrand(AddBrandModel addBrandModel) async{
    final body=jsonEncode(addBrandModel.toJson());
    final uri=Uri.http(baseUrl,"/api/user/brand");
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    },
      body: body,
    );
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }
///
  /// here for upload image
  ///
  @override
  Future<String> postUploadImage(File imageFile)async {
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

    return message;

    } else {
    throw ServerException();
    }
  }
///
  /// here for add product
  ///
  @override
  Future<Unit> postAddProduct(AddProductModel addProductModel)async {
    final body=jsonEncode(addProductModel.toJson());
    final uri=Uri.http(baseUrl,"/api/user/product");
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    },
      body: body,
    );
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }


}




