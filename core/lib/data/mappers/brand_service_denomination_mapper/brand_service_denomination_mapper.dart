import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_denomination_mapper/brand_service_variant_tag_mapper.dart';
import 'package:core/data/mappers/brand_service_denomination_mapper/brand_service_variant_type_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_price_default_mapper.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';

final class BrandServiceDenominationMapper
    implements BaseMapper<BrandServiceDenomination> {
  @override
  Map<String, dynamic> toJson(BrandServiceDenomination data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.programExactDurationVariant: data.programExactDurationVariant,
      _Fields.variantType: data.brandServiceVariantType,
      _Fields.variantTags: data.brandServiceVariantTag,
      _Fields.freeResourceCount: data.freeResourcesCount,
      _Fields.priceDefault: data.brandServicePriceDefault,
    };
  }

  @override
  BrandServiceDenomination fromJson(Map<String, dynamic> json) {
    final jsonBrandServiceVariantTag = json[_Fields.variantTags];

    return BrandServiceDenomination(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      programExactDurationVariant: json[_Fields.programExactDurationVariant],
      brandServiceVariantType:
          BrandServiceVariantTypeMapper().fromJson(json[_Fields.variantType]),
      brandServiceVariantTag: jsonBrandServiceVariantTag is List<dynamic>
          ? jsonBrandServiceVariantTag
              .map((e) => BrandServiceVariantTagMapper().fromJson(e))
              .toList()
          : [
              BrandServiceVariantTagMapper()
                  .fromJson(jsonBrandServiceVariantTag),
            ],
      freeResourcesCount: json[_Fields.freeResourceCount],
      brandServicePriceDefault: BrandServicePriceDefaultMapper().fromJson(
        json[_Fields.priceDefault],
      ),
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  // ignore: lines_longer_than_80_chars
  static const String programExactDurationVariant =
      'program_exact_duration_variant';
  static const String variantType = 'variant_type';
  static const String variantTags = 'variant_variant_tags';
  static const String freeResourceCount = 'free_resources_count';
  static const String priceDefault = 'price_default';
}
