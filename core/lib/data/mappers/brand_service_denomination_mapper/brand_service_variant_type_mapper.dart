import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_variant_type.dart';

final class BrandServiceVariantTypeMapper
    implements BaseMapper<BrandServiceVariantType> {
  @override
  Map<String, dynamic> toJson(BrandServiceVariantType data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.slug: data.slug,
    };
  }

  @override
  BrandServiceVariantType fromJson(Map<String, dynamic> json) {
    return BrandServiceVariantType(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      slug: json[_Fields.slug],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String slug = 'slug';
}
