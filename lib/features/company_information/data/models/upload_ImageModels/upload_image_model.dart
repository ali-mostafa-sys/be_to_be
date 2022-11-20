import 'dart:io';

import 'package:be_to_be/features/company_information/domain/entity/upload_image_entity/upload_image_entity.dart';

class UploadImageModel extends UploadImageEntity{
  const UploadImageModel({
    required File imageFile,
}):super(imageFile: imageFile);

}