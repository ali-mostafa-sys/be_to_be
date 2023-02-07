import 'package:be_to_be/features/contact_us/domain/entity/contact_us_entity.dart';

class ContactUsModel extends ContactUsEntity {
  ContactUsModel(
      {required String address,
      required String mobile,
      required String email,
      required String moreInfo,
      required String? phone})
      : super(
            address: address,
            mobile: mobile,
            email: email,
            moreInfo: moreInfo,
            phone: phone);

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'];
    final mobile = json['mobile'];
    final email = json['email'];
    final moreInfo = json['moreInfo'];
    final phone = json['phone'];
    return ContactUsModel(
        address: address,
        mobile: mobile,
        email: email,
        moreInfo: moreInfo,
        phone: phone);
  }
}
