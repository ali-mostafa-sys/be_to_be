import 'package:equatable/equatable.dart';

class FeaturesEntity extends Equatable {
  final String subscriptionFeatureId;
  final int featureValue;

  const FeaturesEntity({
    required this.subscriptionFeatureId,
    required this.featureValue,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [subscriptionFeatureId, featureValue];
}

class UpgradeEntity extends Equatable {
  final int subscriptionPackageId;
  final int priceUsd;

  /// here for tender per day an tender per month
  final List<FeaturesEntity> features;
  final String nameEn;
  final int validitySeconds;

  const UpgradeEntity({
    required this.subscriptionPackageId,
    required this.priceUsd,
    required this.features,
    required this.nameEn,
    required this.validitySeconds,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [subscriptionPackageId, priceUsd, features, nameEn,validitySeconds];
}
