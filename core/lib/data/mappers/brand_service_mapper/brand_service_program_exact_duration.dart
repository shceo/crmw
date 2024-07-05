import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_price_default_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_program_duration_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';

final class BrandServiceProgramExactDurationMapper
    implements BaseMapper<BrandServiceProgramExactDuration> {
  @override
  Map<String, dynamic> toJson(BrandServiceProgramExactDuration data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.programDuration: data.brandServiceProgramDuration,
      _Fields.priceDefault: data.brandServicePriceDefault,
      _Fields.isActive: data.isActive,
    };
  }

  @override
  BrandServiceProgramExactDuration fromJson(Map<String, dynamic> json) {
    return BrandServiceProgramExactDuration(
      id: json[_Fields.id],
      code: json[_Fields.code],
      brandServiceProgramDuration: BrandServiceProgramDurationMapper().fromJson(
        json[_Fields.programDuration],
      ),
      brandServicePriceDefault: BrandServicePriceDefaultMapper().fromJson(
        json[_Fields.priceDefault],
      ),
      isActive: json[_Fields.isActive],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String programDuration = 'program_duration';
  static const String priceDefault = 'price_default';
  static const String isActive = 'is_active';
}
