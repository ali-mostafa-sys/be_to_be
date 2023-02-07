

import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/add_tender/data/models/add_tender_model/add_tender_model.dart';
import 'package:be_to_be/features/add_tender/data/models/city_add_tender_model/city_add_tender_model.dart';
import 'package:be_to_be/features/add_tender/data/models/countries_model/countries_model.dart';
import 'package:be_to_be/features/add_tender/data/models/product_model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddTenderRemoteDataSource{
  Future<List<ProductModel>>getAllProduct();
  Future<Unit>postAddTender(AddTenderModel addTenderModel);
  Future<List<CountriesModel>>getCountries();
  Future<List<CityAddTenderModel>>getAllCitiesAddTender(int countryId);
}


class AddTenderRemoteDataSourceImpl extends AddTenderRemoteDataSource{

  final  http.Client client;
  final SharedPreferences sharedPreferences;

   AddTenderRemoteDataSourceImpl({required this.client,required this.sharedPreferences});



  ///
  /// here for get all product
  ///
  @override
  Future<List<ProductModel>> getAllProduct()async {
    final uri = Uri.http(baseUrl, '/api/user/products');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    print(response);
    print(response.statusCode);
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final productList=data.map((e) => ProductModel.fromJson(e)).toList();
      return productList;
    }else{
      throw ServerException();
    }


  }
///
  /// here for add tender
  ///
  @override
  Future<Unit> postAddTender(AddTenderModel addTenderModel)async {
    final uri = Uri.http(baseUrl, '/api/user/tender');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(
      uri,
      headers: {
      "Accept":"application/json",
      "Cookie": "$cookies"},
      body: addTenderModel.toJson(),


    );
    print(response);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      return Future.value(unit);
    }else if(response.statusCode==409){
      final data=jsonDecode(response.body);
      if(data['code']=='TENDERS_CNT_MONTHLY_EXCEED'){
        throw AddTenderMonthlyException();
      }
      throw AddTenderDailyException();
    }
    else{
      throw ServerException();
    }

  }
///
  /// get countries
  ///
  @override
  Future<List<CountriesModel>> getCountries()async {
    final uri=Uri.http(baseUrl,'/api/public/countries');
    final cookies = sharedPreferences.getString('cookies');
    final response= await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
    },);
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);

      final data=allData['data'] as List;
      final allCountries=data.map((e) => CountriesModel.fromJson(e)).toList();
      return allCountries;
    }else{
      throw ServerException();
    }
  }
///
  /// here for get all cities
  ///
  @override
  Future<List<CityAddTenderModel>> getAllCitiesAddTender(int countryId)async {
    final queryParameters = {
      "countryId": countryId.toString(),
    };
    final uri = Uri.http(baseUrl, '/api/public/cities',queryParameters,);
    final response = await client.get(
      uri,
      headers: {"Accept":"application/json",
        //"Content-Type":"application/json"

      },
    );
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;
      final cities=data.map((e) => CityAddTenderModel.fromJson(e)).toList();
      return cities;
    }else{
      throw ServerException();
    }
  }

}