import 'package:equatable/equatable.dart';

class PackageUsedEntity extends Equatable{
  final String subscriptionPackageName;
  /// here for all tender
 final int monthAllowTenderCnt;
 final int monthCreatTenderCnt;
 /// here for remaining tender
  final int dayAllowTenderCnt;
  final int dayCreatTenderCnt;


  final String expireAt;
  final int isActive;
  const PackageUsedEntity({
    required this.subscriptionPackageName,
    required this.monthAllowTenderCnt,
    required this.monthCreatTenderCnt,
    required this.dayAllowTenderCnt,
    required this.dayCreatTenderCnt,
    required this.expireAt,
    required this.isActive,
});
  @override
  // TODO: implement props
  List<Object?> get props => [subscriptionPackageName,expireAt,isActive,monthAllowTenderCnt,monthCreatTenderCnt,dayAllowTenderCnt,dayCreatTenderCnt];

}