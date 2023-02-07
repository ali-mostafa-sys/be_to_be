import 'dart:io';

import 'package:equatable/equatable.dart';

class UploadImageProfileEntity extends Equatable{
  final File imageFile;
  const UploadImageProfileEntity({
    required this.imageFile
  });

  @override
  // TODO: implement props
  List<Object?> get props => [imageFile];

}