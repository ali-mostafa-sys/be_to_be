import 'dart:io';

import 'package:equatable/equatable.dart';

class UploadImageEntity extends Equatable{
  final File imageFile;
  const UploadImageEntity({
    required this.imageFile
});

  @override
  // TODO: implement props
  List<Object?> get props => [imageFile];

}