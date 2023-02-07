

import 'package:equatable/equatable.dart';

class CityAddTenderEntity extends Equatable{
  final String nameEn;
  final int idCity;
  const CityAddTenderEntity({
    required this.nameEn,
    required this.idCity,
});
  @override
  // TODO: implement props
  List<Object?> get props =>[nameEn,idCity];

}