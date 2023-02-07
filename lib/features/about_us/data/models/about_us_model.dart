import 'package:be_to_be/features/about_us/domain/entity/about_us_entity.dart';

class AboutUsModel extends AboutUsEntity {
  AboutUsModel(
      {required String companyInfoEn,
      required String viewEn,
      required String targetEn,
      required String otherInfoEn,
      required String? whoAreWeEn})
      : super(
            companyInfoEn: companyInfoEn,
            viewEn: viewEn,
            targetEn: targetEn,
            otherInfoEn: otherInfoEn,
            whoAreWeEn: whoAreWeEn);

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    final companyInfoEn = json['companyInfoEn'];
    final viewEn = json['viewEn'];
    final targetEn = json['targetEn'];
    final otherInfoEn = json['otherInfoEn'];
    final whoAreWeEn = json['whoAreWeEn'];
    return AboutUsModel(
        companyInfoEn: companyInfoEn,
        viewEn: viewEn,
        targetEn: targetEn,
        otherInfoEn: otherInfoEn,
        whoAreWeEn: whoAreWeEn);
  }
}
