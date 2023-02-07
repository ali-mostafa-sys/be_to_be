


import 'dart:io';

import 'package:be_to_be/features/profile/domain/entity/upload_image_entity/upload_image_entity.dart';

class UploadProfileImageModel extends UploadImageProfileEntity{
  const UploadProfileImageModel({
    required File imageFile,
  }):super(imageFile: imageFile);
}