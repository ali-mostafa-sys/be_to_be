
import 'package:be_to_be/features/company_information/domain/entity/upload_image_entity/response_upload_image_entity.dart';

class ResponseUploadImageModel extends ResponseUploadImageEntity{

   ResponseUploadImageModel({
    required String imageUrl,
}):super(imageUrl: imageUrl);

  factory ResponseUploadImageModel.fromJson(Map<String,dynamic>json){
    final imageUrl =json['imgUrl'];
    return ResponseUploadImageModel(imageUrl: imageUrl);
  }
}