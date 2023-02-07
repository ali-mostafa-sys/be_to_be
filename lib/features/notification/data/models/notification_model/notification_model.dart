

import 'package:be_to_be/features/notification/domain/entity/noti_entity/noti_entity.dart';

class NotificationModel extends NotificationEntity{

  const NotificationModel({
    required int notificationId,
    required String title,
    required String content,
    required String creatAt,
     String? readAt,
     String? imgUrl,
}):super(
    notificationId: notificationId,title: title,content: content,creatAt: creatAt,readAt: readAt,imgUrl: imgUrl
  );

  factory NotificationModel.fromJson(Map<String,dynamic>json){
    final notificationId=json['notificationId'];
    final title=json['title'];
    final content=json['content'];
    final creatAt=json['creatAt'];
    final readAt=json['readAt'];
    final imgUrl=json['imgUrl'];
    return NotificationModel(notificationId: notificationId, title: title, content: content, creatAt: creatAt, readAt: readAt,imgUrl: imgUrl);

  }

}