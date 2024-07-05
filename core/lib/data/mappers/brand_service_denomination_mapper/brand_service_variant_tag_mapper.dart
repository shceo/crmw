import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_variant_tag.dart';

final class BrandServiceVariantTagMapper
    implements BaseMapper<BrandServiceVariantTag> {
  @override
  Map<String, dynamic> toJson(BrandServiceVariantTag data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
    };
  }

  @override
  BrandServiceVariantTag fromJson(Map<String, dynamic> json) {
    return BrandServiceVariantTag(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
}
