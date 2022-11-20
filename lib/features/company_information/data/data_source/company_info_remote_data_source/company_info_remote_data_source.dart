import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/company_information/data/models/add_company_mosel/add_company_model.dart';
import 'package:be_to_be/features/company_information/data/models/all_company_type_model/all_company_type_model.dart';
import 'package:be_to_be/features/company_information/data/models/cities_model/cities_model.dart';
import 'package:be_to_be/features/company_information/data/models/country_model/country_model.dart';
import 'package:be_to_be/features/company_information/data/models/upload_ImageModels/response_upload_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class CompanyInfoRemoteDataSource {
  Future<AllCompanyTypeModel> getAllCompanyType();

  Future<List<CountryModel>> getAllCountry();

  Future<ResponseUploadImageModel> postUploadImage(File imageFile);
  Future<List<CitiesModel>>getAllCities(int countryId);
  Future <Unit>postAddCompany(AddCompanyModel addCompanyModel);
}

class CompanyInfoRemoteDataSourceImpl implements CompanyInfoRemoteDataSource {
  final http.Client client;

  const CompanyInfoRemoteDataSourceImpl({required this.client});

  ///
  /// here for get all companies type
  ///
  @override
  Future<AllCompanyTypeModel> getAllCompanyType() async {
    final uri = Uri.http(baseUrl, '/api/public/company-type');
    final response = await client.get(
      uri,headers: {"Accept":"application/json",}
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userDataModel = AllCompanyTypeModel.fromJson(data);
      return userDataModel;
    } else {
      throw ServerException();
    }
  }

  ///
  /// here for upload license image
  ///
  @override
  Future<ResponseUploadImageModel> postUploadImage(File imageFile) async {
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

      return ResponseUploadImageModel(imageUrl: message);
    } else {
      throw ServerException();
    }
  }
///
  /// here for get all country
  ///
  @override
  Future<List<CountryModel>> getAllCountry()async {
    final uri = Uri.http(baseUrl, '/api/public/countries');
    final response = await client.get(
      uri,headers: {"Accept":"application/json",}
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final data =responseData['data']as List;
      final countryData =data.map((e) {
       return CountryModel.fromJson(e);
      }).toList() ;
      return countryData;
    } else {
      throw ServerException();
    }
  }
  ///
  /// here for get all cities
  ///
  @override
  Future<List<CitiesModel>> getAllCities(int countryId)async {
    // final url='http://167.235.141.213/api/public/cities?countryId=${countryId.toString()}';
     final queryParameters = {
       "countryId": "4"
     };
    final uri = Uri.http(baseUrl, '/api/public/cities',queryParameters,);
   // print(uri);
    final response = await client.get(
    //  Uri.parse(url),
      uri,


      headers: {"Accept":"application/json",
      //"Content-Type":"application/json"

    },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData =await jsonDecode(response.body);
      //print(responseData);
      final data =responseData['data']as List;
      print(data.first);
      final citiesData =data.map((e) {
        return CitiesModel.fromJson(e);
      }).toList() ;
      return citiesData;
    } else {
      throw ServerException();
    }



  }
///
  /// here add company
  ///
  @override
  Future<Unit> postAddCompany(AddCompanyModel addCompanyModel) async{
    final uri = Uri.http(baseUrl, '/api/public/company',);
    final response = await client.post(
      uri,
      body: addCompanyModel.toJson(),
      headers: {"Accept":"application/json",

      },
    );
    if (response.statusCode == 200) {

      return Future.value(unit);
    } else {
      throw ServerException();
    }




  }
}
