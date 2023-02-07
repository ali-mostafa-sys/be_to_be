import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/offers/data/models/cities_model/cities_offer_model.dart';
import 'package:be_to_be/features/offers/data/models/offer_model/get_all_offers_model.dart';
import 'package:be_to_be/features/offers/data/models/offer_model/get_all_tender_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OfferRemoteDataSource {
  Future<List<GetAllTenderModel>> getAllTender();

  Future<List<GetAllOffersModel>> getAllOffers(int tenderId);

  Future<Unit> deleteOffer(int offerId);

  Future<List<CitiesOfferModel>> getCitiesOffer();
  Future<Unit>postAcceptOffer(int offerId);
}

class OfferRemoteDataSourceImpl extends OfferRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  OfferRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<List<GetAllTenderModel>> getAllTender() async {
    final uri = 'http://91.208.95.203/api/user/tenders?onlyCreated=1';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(Uri.parse(uri), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    print(response.body);
    if (response.statusCode == 200) {
      final allData = jsonDecode(response.body);
      if (allData['data'] .isEmpty) {
        throw TenderIsEmptyException();
      } else {
        final data = allData['data'] as List;
        final listOfTender =
            data.map((e) => GetAllTenderModel.fromJson(e)).toList();
        return listOfTender;
      }
    } else {
      throw ServerException();
    }
  }

  ///
  /// here for get all offers on tender
  ///
  @override
  Future<List<GetAllOffersModel>> getAllOffers(int tenderId) async {
    final uri =
        'http://91.208.95.203/api/user/offers?tenderId=${tenderId.toString()}';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(Uri.parse(uri), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if (response.statusCode == 200) {
      final allData = jsonDecode(response.body);
      print(allData);
      if (allData['data'].isEmpty) {
        throw OffersIsEmptyException();
      } else {
        final data = allData['data'] as List;
        final listOfOffers =
            data.map((e) => GetAllOffersModel.fromJson(e)).toList();
        return listOfOffers;
      }
    } else {
      throw ServerException();
    }
  }

  ///
  /// here for delete offer
  ///
  @override
  Future<Unit> deleteOffer(int offerId) async {
    final uri = 'http://91.208.95.203/api/user/offer';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.delete(Uri.parse(uri), headers: {
      "Accept": "application/json",
      //"Content-Type": "application/json",
      "Cookie": "$cookies"
    }, body: {
      "idOffer": offerId.toString()
    });
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  ///
  /// here for get all cities
  ///
  @override
  Future<List<CitiesOfferModel>> getCitiesOffer() async {
    final url = Uri.http(baseUrl, '/api/public/cities');
    final response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Cookie": "$cookies"
    });
    if (response.statusCode == 200) {
      final allData = jsonDecode(response.body);
      final data = allData['data'] as List;
      final cities = data.map((e) => CitiesOfferModel.fromJson(e)).toList();
      return cities;
    } else {
      throw ServerException();
    }
  }
///
  /// here for accept offer
  ///
  @override
  Future<Unit> postAcceptOffer(int offerId)async {

    final uri = 'http://b2back.net/api/user/offer/accept';
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.post(Uri.parse(uri), headers: {
      "Accept": "application/json",
      //"Content-Type": "application/json",
      "Cookie": "$cookies"
    }, body: {
      "idOffer": offerId.toString()
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }


  }
}
