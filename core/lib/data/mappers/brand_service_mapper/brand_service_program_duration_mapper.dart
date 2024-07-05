import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_duration.dart';

final class BrandServiceProgramDurationMapper
    implements BaseMapper<BrandServiceProgramDuration> {
  @override
  Map<String, dynamic> toJson(BrandServiceProgramDuration data) {
    return {
      _Fields.value: data.value,
      _Fields.unit: data.unit,
    };
  }

  @override
  BrandServiceProgramDuration fromJson(Map<String, dynamic> json) {
    return BrandServiceProgramDuration(
      value: json[_Fields.value],
      unit: json[_Fields.unit],
    );
  }
}

abstract final class _Fields {
  static const String value = 'value';
  static const String unit = 'unit';
}
