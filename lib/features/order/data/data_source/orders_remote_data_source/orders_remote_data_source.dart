



import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/order/data/models/my_offer_model/my_offer_model.dart';
import 'package:be_to_be/features/order/data/models/order_models/add_offer_model.dart';
import 'package:be_to_be/features/order/data/models/order_models/get_order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrdersRemoteDataSource{

  Future<List<GetOrderModel>>getOrders();
  Future<Unit>postAddOffer(AddOfferModel addOfferModel);
  Future<MyOfferModel>getMyOffer(int tenderId,int creatByUserId );
  Future<Unit>deleteOfferOrder(int offerId);
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

   OrdersRemoteDataSourceImpl({required this.client,required this.sharedPreferences});
///
  /// here for get all order
  ///
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
    print(addOfferModel);
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
///
  /// here for get my offer
  ///
  @override
  Future<MyOfferModel> getMyOffer(int tenderId, int creatByUserId) async{
   final uri='http://${baseUrl}/api/user/offers?tenderId=$tenderId&creatByUserId=$creatByUserId';
   final cookies = sharedPreferences.getString('cookies');
   final response = await client.get(Uri.parse(uri), headers: {
     "Accept": "application/json",
     "Content-Type": "application/json",
     "Cookie": "$cookies"
   });

   if(response.statusCode==200){
     final allData=jsonDecode(response.body);
     final data=allData['data']as List;
     print(allData);
     if(data.isEmpty){
       throw MyOfferIsEmptyException();

     }else{
       //final data=allData['data'][0];
       print(data);
       final myOffer=MyOfferModel.fromJson(data[0]);
       return myOffer;
     }

   }else{
     throw ServerException();
   }

  }
///
  /// here for delete offer
  ///
  @override
  Future<Unit> deleteOfferOrder(int offerId) async{
    // offerId.toString()

    final body= jsonEncode({
      "idOffer":'$offerId'

    });
    final uri=Uri.http(baseUrl,'/api/user/offer');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.delete(uri, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    },
    body:body
    );

    if(response.statusCode==200){

      return Future.value(unit);

    }else{
      throw ServerException();
    }



  }

}


