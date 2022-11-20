
import 'package:equatable/equatable.dart';

class CityEntity extends Equatable{
  final String nameEn;
  final int cityId;
  const CityEntity({
    required this.nameEn,required this.cityId,
});

  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,cityId];

}