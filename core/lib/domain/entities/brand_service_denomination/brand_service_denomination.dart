import 'package:core/domain/entities/brand_service_denomination/brand_service_variant_tag.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_variant_type.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_price_default.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceDenomination extends DomainObject {
  final int id;
  final String code;
  final String name;
  final int programExactDurationVariant;
  final BrandServiceVariantType? brandServiceVariantType;
  final List<BrandServiceVariantTag>? brandServiceVariantTag;
  final int freeResourcesCount;
  final BrandServicePriceDefault brandServicePriceDefault;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        programExactDurationVariant,
        brandServiceVariantType,
        brandServiceVariantTag,
        freeResourcesCount,
        brandServicePriceDefault,
      ];

  const BrandServiceDenomination({
    required this.id,
    required this.code,
    required this.name,
    required this.programExactDurationVariant,
    required this.freeResourcesCount,
    required this.brandServicePriceDefault,
    this.brandServiceVariantType,
    this.brandServiceVariantTag,
  });

  @override
  BrandServiceDenomination copyWith() {
    return BrandServiceDenomination(
      id: id,
      code: code,
      name: name,
      programExactDurationVariant: programExactDurationVariant,
      brandServiceVariantType: brandServiceVariantType,
      brandServiceVariantTag: brandServiceVariantTag,
      freeResourcesCount: freeResourcesCount,
      brandServicePriceDefault: brandServicePriceDefault,
    );
  }
}
