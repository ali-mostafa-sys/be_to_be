



import 'dart:io';

import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';

class UploadCTImageModel extends UploadCTImageEntity{
  const UploadCTImageModel({
    required File imageFile,
  }):super(imageFile: imageFile);

}