


import 'dart:io';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/profile/domain/entity/upload_image_entity/response_upload_image_entity.dart';
import 'package:be_to_be/features/profile/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class UploadProfileImageUseCase {
  final ProfileRepositories profileRepositories;
  const UploadProfileImageUseCase({
    required this.profileRepositories
  });
  Future <Either<Failure,ResponseUploadProfileImageEntity>>call(File imageFile)async{
    return await profileRepositories.postUploadProfileImage(imageFile);

  }
}