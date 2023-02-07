

import 'package:equatable/equatable.dart';

class SettingEntity extends Equatable{

final String nameEn;
final String value;
const SettingEntity({
  required this.nameEn,
  required this.value,
});

  @override
  // TODO: implement props
  List<Object?> get props =>[nameEn,value];



}