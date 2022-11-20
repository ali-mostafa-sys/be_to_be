

import 'dart:io';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/company_information/domain/entity/upload_image_entity/response_upload_image_entity.dart';
import 'package:be_to_be/features/company_information/domain/rpositories/company_info_repositories.dart';
import 'package:dartz/dartz.dart';

class UploadImageUseCase {
  final CompanyInfoRepositories companyInfoRepositories;
  const UploadImageUseCase({
    required this.companyInfoRepositories
});
  Future <Either<Failure,ResponseUploadImageEntity>>call(File imageFile)async{
    return await companyInfoRepositories.postUploadImage(imageFile);

  }
}