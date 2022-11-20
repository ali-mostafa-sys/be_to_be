import 'package:equatable/equatable.dart';

class ResponseUploadImageEntity extends Equatable{
  final String imageUrl;
  const ResponseUploadImageEntity({
    required this.imageUrl
});
  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl];

}