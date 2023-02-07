

import 'package:equatable/equatable.dart';

class TermsEntity extends Equatable{
  final String contentEn;

  TermsEntity({
   required this.contentEn
});

  @override
  // TODO: implement props
  List<Object?> get props => [contentEn];

}