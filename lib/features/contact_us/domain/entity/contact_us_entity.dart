import 'package:equatable/equatable.dart';

class ContactUsEntity extends Equatable {
  final String address;
  final String mobile;
  final String email;
  final String moreInfo;
  final String? phone;

  ContactUsEntity(
      {required this.address,
      required this.mobile,
      required this.email,
      required this.moreInfo,
      required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [address,mobile,email,moreInfo,phone];
}
