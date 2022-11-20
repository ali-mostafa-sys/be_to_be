



import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/order/data/models/order_models/add_offer_model.dart';
import 'package:be_to_be/features/order/data/models/order_models/get_order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrdersRemoteDataSource{

  Future<List<GetOrderModel>>getOrders();
  Future<Unit>postAddOffer(AddOfferModel addOfferModel);
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

   OrdersRemoteDataSourceImpl({required this.client,required this.sharedPreferences});

  @override
  Future<List<GetOrderModel>> getOrders()async {
    final uri=Uri.http(baseUrl, '/api/user/tenders');
    final cookies=sharedPreferences.getString('cookies');
    final response=await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type":"application/json","Cookie":"$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data'] as List;

      final listGetOrderModel=data.map((e) {

        return GetOrderModel.fromJson(e);
      }).toList();
      return listGetOrderModel;

    }else{
      throw ServerException();
    }
  }
///
  /// here for post offer
  ///
  @override
  Future<Unit> postAddOffer(AddOfferModel addOfferModel)async {
    final uri=Uri.http(baseUrl, '/api/user/offer');
    final cookies=sharedPreferences.getString('cookies');
    final response=await client.post(uri,headers: {
      "Accept":"application/json",
      //"Content-Type":"application/json",
      "Cookie":"$cookies",
    },body: addOfferModel.toJson());
    print(response.statusCode);
    print(addOfferModel);
    if(response.statusCode==200){
      return Future.value(unit);
    }else{throw ServerException();}


  }

}


