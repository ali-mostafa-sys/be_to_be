

import 'package:equatable/equatable.dart';

class PrivacyEntity extends Equatable{
  final String contentEn;

  PrivacyEntity({
    required this.contentEn
});

  @override
  // TODO: implement props
  List<Object?> get props => [contentEn];

}