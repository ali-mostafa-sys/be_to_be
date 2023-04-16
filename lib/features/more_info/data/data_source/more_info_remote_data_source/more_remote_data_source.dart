


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/more_info/data/models/offer_owner_info_model/offer_owner_info_model.dart';
import 'package:be_to_be/features/more_info/data/models/tender_owner_info_model/tender_owner_info_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class MoreInfoRemoteDataSource{

  Future<TenderOwnerInfoModel>getTenderOwnerInfo(int tenderId);
  Future<OfferOwnerInfoModel>getOfferOwnerInfo(int offerId);
  Future<Unit>postOfferExecuted(int offerId);


}

class MoreInfoRemoteDataSourceImpl extends MoreInfoRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  MoreInfoRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
});


  ///
  /// here for get tender owner info
  ///
  @override
  Future<TenderOwnerInfoModel> getTenderOwnerInfo(int tenderId) async{
    final queryParameters = {
      "tenderId": tenderId.toString(),
    };
    final uri=Uri.http(baseUrl, '/api/user/tender/contacts',queryParameters);
    final cookies=sharedPreferences.getString('cookies');
    final response=  await client.get(
      uri,
      headers: {"Accept":"application/json",
        "Content-Type":"application/json",
        "Cookie":"$cookies"
      },
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      final tenderOwnerInfo=TenderOwnerInfoModel.fromJson(data['data']);
      return tenderOwnerInfo;
    }else{
      throw ServerException();
    }


  }
///
  /// here for get offer owner info
  ///
  @override
  Future<OfferOwnerInfoModel> getOfferOwnerInfo(int offerId) async{
    final queryParameters = {
      "offerId": offerId.toString(),
    };
    final uri=Uri.http(baseUrl, '/api/user/tender/contacts',queryParameters);
    final cookies=sharedPreferences.getString('cookies');
    final response=  await client.get(
      uri,
      headers: {"Accept":"application/json",
        "Content-Type":"application/json",
        "Cookie":"$cookies"
      },
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      final offerOwnerInfo=OfferOwnerInfoModel.fromJson(data['data']);
      return offerOwnerInfo;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> postOfferExecuted(int offerId)async {
    final body = {
      "idOffer": offerId.toString(),
    };
    final uri=Uri.http(baseUrl, '/api/user/offer/execute',);
    final cookies=sharedPreferences.getString('cookies');
    final response=  await client.post(
      uri,body: jsonEncode(body),

      headers: {"Accept":"application/json",
        "Content-Type":"application/json",
        "Cookie":"$cookies"
      },

    );
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

}
