import 'package:equatable/equatable.dart';

class TenderOwnerInfoEntity extends Equatable {
  final String tenderCityName;
  final String tenderCountryName;
  final String tenderArea;
  final String tenderStreet;
  final String tenderBuildingNo;
  final String tenderSupplierLocation;
  final String mobile;
  final String companyCityName;
  final String companyCountryName;
  final String companyArea;
  final String? companyName;
  final String companyStreet;
  final String companyBuildingNumber;
  final int hasMobileWhatsapp;

  TenderOwnerInfoEntity({
   required this.tenderCityName,
    required this.tenderCountryName,
    required this.companyName,
    required  this.tenderArea,
    required  this.tenderStreet,
    required  this.tenderBuildingNo,
    required this.tenderSupplierLocation,
    required this.mobile,
    required this.companyCityName,
    required this.companyCountryName,
    required this.companyArea,
    required this.companyStreet,
    required this.companyBuildingNumber,
    required this.hasMobileWhatsapp
});

  @override
  // TODO: implement props
  List<Object?> get props => [companyName,tenderCityName,tenderCountryName,tenderArea,tenderStreet,tenderBuildingNo,tenderSupplierLocation,
  mobile,companyCityName,companyCountryName,companyArea,companyStreet,companyBuildingNumber,hasMobileWhatsapp,
  ];
}
