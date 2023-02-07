


import 'dart:convert';

import 'package:be_to_be/core/errors/exceptions.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/features/notification/data/models/notification_model/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationRemoteDataSource{

  Future<List<NotificationModel>>getNotification();
  Future<Unit>postRearNotification(int notificationId);


}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
   NotificationRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
});
  ///
  /// here for get all notification
  ///
  @override
  Future<List<NotificationModel>> getNotification()async {
    final uri = Uri.http(baseUrl, '/api/user/notifications');
    final cookies = sharedPreferences.getString('cookies');
    final response = await client.get(uri,headers: {
      "Accept":"application/json",
      "Content-Type": "application/json",
      "Cookie": "$cookies"
    });
    if(response.statusCode==200){
      final allData=jsonDecode(response.body);
      if(allData['data'].isEmpty){
        throw NotificationIsEmptyException();
      }else{
        final data=allData['data']as List;
        final notifications=data.map((e) => NotificationModel.fromJson(e)).toList();
        return notifications;
      }


      
    }else{
      throw ServerException();
    }
  }
///
  /// here for read notification
  ///
  @override
  Future<Unit> postRearNotification(int notificationId)async {

    List<int> not = [notificationId];

    final body=jsonEncode(
        {
          'notificationsIds':not
        }
    );
    print(body);

   final uri=Uri.http(baseUrl,'/api/user/notifications/read');
   final cookies = sharedPreferences.getString('cookies');
   final response = await client.post(uri,headers: {
     "Accept":"application/json",
    // "Content-Type": "application/json",
     "Cookie": "$cookies",

   },
     body: body,
   );
   print(response.body  );
   print(response.statusCode  );
   if(response.statusCode==200){
     return Future.value(unit);
   }else{
     throw ServerException();
   }



  }

}


// List<int> not = [notificationId];
// Map<String, dynamic> body = {"notificationsIds": not};
// print(jsonEncode(body));