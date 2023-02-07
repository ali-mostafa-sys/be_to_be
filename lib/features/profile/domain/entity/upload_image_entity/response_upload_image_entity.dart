import 'package:equatable/equatable.dart';

class ResponseUploadProfileImageEntity extends Equatable{
  final String imageUrl;
  const ResponseUploadProfileImageEntity({
    required this.imageUrl
  });
  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl];

}