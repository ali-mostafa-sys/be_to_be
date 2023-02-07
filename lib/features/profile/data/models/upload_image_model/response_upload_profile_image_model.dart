

import 'package:be_to_be/features/profile/domain/entity/upload_image_entity/response_upload_image_entity.dart';

class ResponseUploadProfileImageModel extends ResponseUploadProfileImageEntity{

  // final String imageUrl;
  const ResponseUploadProfileImageModel({
    required String imageUrl,
}):super(imageUrl: imageUrl);
  factory ResponseUploadProfileImageModel.fromJson(Map<String,dynamic>json){
    final imageUrl=json['imgUrl'];
    return ResponseUploadProfileImageModel(imageUrl: imageUrl);
  }
}