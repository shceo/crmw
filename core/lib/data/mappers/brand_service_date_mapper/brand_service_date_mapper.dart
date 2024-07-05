import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';

final class BrandServiceDateMapper implements BaseMapper<BrandServiceDate> {
  @override
  Map<String, dynamic> toJson(BrandServiceDate data) {
    return {
      _Fields.date: data.date,
      _Fields.day: data.day,
    };
  }

  @override
  BrandServiceDate fromJson(Map<String, dynamic> json) {
    return BrandServiceDate(
      date: json[_Fields.date],
      day: json[_Fields.day],
    );
  }
}

abstract final class _Fields {
  static const String date = 'date';
  static const String day = 'day';
}
