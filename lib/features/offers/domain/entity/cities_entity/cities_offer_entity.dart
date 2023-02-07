

import 'package:equatable/equatable.dart';

class CitiesOfferEntity extends Equatable{
  final String nameEn;
  final int idCity;
  const CitiesOfferEntity({
    required this.nameEn,
    required this.idCity,
});

  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idCity];

}