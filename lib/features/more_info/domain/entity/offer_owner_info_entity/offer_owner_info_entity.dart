import 'package:equatable/equatable.dart';

class OfferOwnerInfoEntity extends Equatable {
  final String companyCityName;
  final String companyCountryName;
  final String mobile;
  final String? companyName;
  final String companyArea;
  final String companyStreet;
  final int hasMobileWhatsapp;

const  OfferOwnerInfoEntity({
   required this.companyCityName,
    required this.companyCountryName,
    required this.mobile,
    required this.companyName,
    required this.companyArea,
    required this.companyStreet,
    required this.hasMobileWhatsapp,
});

  @override
  // TODO: implement props
  List<Object?> get props => [companyName,companyCityName,companyCountryName,mobile,companyArea,companyStreet,hasMobileWhatsapp];
}
