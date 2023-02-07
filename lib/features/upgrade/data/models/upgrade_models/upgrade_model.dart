import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';

class FeaturesModel extends FeaturesEntity {
  const FeaturesModel({
    required String subscriptionFeatureId,
    required int featureValue,
  }) : super(
            subscriptionFeatureId: subscriptionFeatureId,
            featureValue: featureValue);

  factory FeaturesModel.fromJson(Map<String, dynamic> json) {
    final subscriptionFeatureId = json['subscriptionFeatureId'];
    final featureValue = json['featureValue'];
    return FeaturesModel(
        subscriptionFeatureId: subscriptionFeatureId,
        featureValue: featureValue);
  }
}

class UpgradeModel extends UpgradeEntity {
  const UpgradeModel({
    required int subscriptionPackageId,
    required int priceUsd,
    required List<FeaturesModel> features,
    required String nameEn,
    required int validitySeconds,
  }) : super(
          subscriptionPackageId: subscriptionPackageId,
          priceUsd: priceUsd,
          features: features,
          nameEn: nameEn,
          validitySeconds: validitySeconds,
        );

  factory UpgradeModel.fromJson(Map<String, dynamic> json) {
    final subscriptionPackageId = json['idSubscriptionPackage'];
    final priceUsd = json['priceUsd'];
    final allFeatures = json['features'] as List;
    final features = allFeatures.map((e) => FeaturesModel.fromJson(e)).toList();
    final nameEn = json['nameEn'];
    final validitySeconds = json['validitySeconds'];
    return UpgradeModel(
      subscriptionPackageId: subscriptionPackageId,
      priceUsd: priceUsd,
      features: features,
      nameEn: nameEn,
      validitySeconds: validitySeconds,
    );
  }
}
