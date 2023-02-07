

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';
import 'package:be_to_be/features/create_tender/domain/repositories/create_tender_repositories/create_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class UploadCTImageUseCase {
  final CreateTenderRepositories createTenderRepositories;
  const UploadCTImageUseCase({
    required this.createTenderRepositories,
});

  Future<Either<Failure,String>>call(UploadCTImageEntity uploadCTImageEntity)async{
    return await createTenderRepositories.uploadImage(uploadCTImageEntity);

  }
}