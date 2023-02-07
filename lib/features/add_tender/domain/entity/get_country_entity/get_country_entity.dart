

import 'package:equatable/equatable.dart';

class CountriesEntity extends Equatable{
  final String nameEn;
  final int idCountry;
  const CountriesEntity({
   required this.nameEn,required this.idCountry,
});
  @override
  // TODO: implement props
  List<Object?> get props => [nameEn,idCountry];

}