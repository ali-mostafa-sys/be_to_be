// {
// "idCountry": 4,
// "nameEn": "Algeria",
// "nameAr": "الجزائر",
// "isoCode": "DZ",
// "phoneCode": "213",
// "imgId": null
// },

import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable{
  final String nameEn;
  final int countryId;
  const CountryEntity({
  required this.nameEn,
required this.countryId
});
  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,countryId];

}