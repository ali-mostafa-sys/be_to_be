


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/chooase_tender/data/models/brand_model/brand_model.dart';
import 'package:be_to_be/features/chooase_tender/data/models/care_model/care_model.dart';
import 'package:be_to_be/features/chooase_tender/data/models/categories_model/categories_model.dart';
import 'package:be_to_be/features/chooase_tender/data/models/my_interests_model/my_interests_model.dart';
import 'package:be_to_be/features/chooase_tender/data/models/product_model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChooseTenderRemoteDataSource {
Future<List<MyInterestsModel>>getMyInterests();
  Future<List<CategoriesChooseTenderModel>>getCategories();
  Future<List<BrandChooseTenderModel>>getBrands();
  Future<List<ProductChooseTenderModel>>getProducts();
  Future<Unit>postCare(DataModel dataModel);
}

class ChooseTenderRemoteDataSourceImpl extends ChooseTenderRemoteDataSource{
  final SharedPreferences sharedPreferences;
  final http.Client client;

   ChooseTenderRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences
});




  ///
  /// here for get all categories
  ///
  @override
  Future<List<CategoriesChooseTenderModel>> getCategories()async {
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
      final categories=data.map((e) => CategoriesChooseTenderModel.fromJson(e)).toList();
      return categories;
    }else{
      throw ServerException();
    }
  }
///
  /// here for post cares
  ///
  @override
  Future<Unit> postCare(DataModel dataModel)async {
    print(dataModel.toJson());
    final data =jsonEncode( dataModel.toJson());
    final uri = Uri.http(baseUrl,'/api/user/cares/reset');
    print(uri);
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    },
      body:data

    );
    print(response);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      await sharedPreferences.setBool('chooseTender', true);

      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }
///
  /// here for get brands
  ///
  @override
  Future<List<BrandChooseTenderModel>> getBrands() async{
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
        return BrandChooseTenderModel.fromJson(e);
      }).toList();
      return brands;
    }else{
      throw ServerException();
    }

  }
///
  /// here for get products
  ///
  @override
  Future<List<ProductChooseTenderModel>> getProducts()async {
    final uri = Uri.http(baseUrl, '/api/user/products');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List;
      final products=data.map((e){
        return ProductChooseTenderModel.fromJson(e);
      }).toList();
      return products;
    }else{
      throw ServerException();
    }
  }
///
  /// here get my interests
  ///
  @override
  Future<List<MyInterestsModel>> getMyInterests() async{
    final uri = Uri.http(baseUrl, '/api/user/cares');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List;
      if(data.isEmpty){
        throw MyInterestsIsEmptyException();
      }


      final myInterestsModel=data.map((e) {
        return MyInterestsModel.fromJson(e);
      }).toList();
      return myInterestsModel;
    }else{
      throw ServerException();
    }
  }

}







