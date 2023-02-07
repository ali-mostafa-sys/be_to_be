

import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable{
    final int notificationId;
    final String title;
    final String content;
    final String creatAt;
    final String? readAt;
    final String? imgUrl;
    const NotificationEntity({
      required this.title,
      required this.content,
      required this.creatAt,
      required this.notificationId,
       this.readAt,
       this.imgUrl,

});
  @override
  // TODO: implement props
  List<Object?> get props => [notificationId,title,content,creatAt,readAt,imgUrl];

}