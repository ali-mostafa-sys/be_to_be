import 'package:equatable/equatable.dart';

class AboutUsEntity extends Equatable {
  final String companyInfoEn;
  final String viewEn;
  final String targetEn;
  final String otherInfoEn;
  final String? whoAreWeEn;

  AboutUsEntity(
      {
        required this.companyInfoEn,
        required this.viewEn,
        required  this.targetEn,
        required  this.otherInfoEn,
        required this.whoAreWeEn});

  @override
  // TODO: implement props
  List<Object?> get props => [companyInfoEn,viewEn,targetEn,otherInfoEn,whoAreWeEn];
}
