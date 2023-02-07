



import 'dart:io';

import 'package:equatable/equatable.dart';

class UploadCTImageEntity extends Equatable{
  final File imageFile;
  const UploadCTImageEntity({
    required this.imageFile,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [imageFile];

}