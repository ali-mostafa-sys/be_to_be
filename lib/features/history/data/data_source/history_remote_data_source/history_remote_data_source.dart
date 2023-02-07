import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/history/data/models/order_h_model/order_h_model.dart';
import 'package:be_to_be/features/history/data/models/tender_h_model/tender_h_model.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class HistoryRemoteDataSource {

  Future<List<TenderHModel>>getTender();
  Future<List<OrderHModel>>getOrder();

}





class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource{

  final http.Client client;
  final SharedPreferences sharedPreferences;

  HistoryRemoteDataSourceImpl({
   required this.client,
   required this.sharedPreferences
});

///
  /// here for get tender
  ///

  @override
  Future<List<TenderHModel>> getTender()async{
    final uri='http://${baseUrl}/api/user/tenders?onlyCreated=1';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(Uri.parse(uri), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List;

      if(data.isEmpty){
        throw TenderIsEmptyException();
      }else{
        final tenders=data.map((e) => TenderHModel.fromJson(e)).toList();
        return tenders;
      }


    }else{
      throw ServerException();
    }
  }
///
  /// here for get order
  ///
  @override
  Future<List<OrderHModel>> getOrder()async {
    final userId=sharedPreferences.getString('userId');
    final cookies = sharedPreferences.getString('cookies');
    final uri='http://${baseUrl}/api/user/offers?creatByUserId=$userId';
    final response = await client.get(Uri.parse(uri), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });

    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      final data=allData['data']as List ;
      if(data.isEmpty){
        throw OrderIsEmptyException();
      }else{
        final orders=data.map((e) =>OrderHModel.fromJson(e)).toList();
        return orders;

      }


    }else{
      throw ServerException();
    }


  }


}

