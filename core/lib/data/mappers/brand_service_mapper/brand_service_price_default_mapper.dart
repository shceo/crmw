import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_currency_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_price_default.dart';

final class BrandServicePriceDefaultMapper
    implements BaseMapper<BrandServicePriceDefault> {
  @override
  Map<String, dynamic> toJson(BrandServicePriceDefault data) {
    return {
      _Fields.id: data.id,
      _Fields.currency: data.brandServiceCurrency,
      _Fields.code: data.code,
      _Fields.created: data.created,
      _Fields.updated: data.updated,
      _Fields.isActive: data.isActive,
      _Fields.name: data.name,
      _Fields.value: data.value,
      _Fields.isPriceDependsOnQuantity: data.isPriceDependsOnQuantity,
      _Fields.isPriceDependsOnWeekdayTime: data.isPriceDependsOnWeekdayTime,
      _Fields.dateStart: data.dateStart,
      _Fields.programExactDurationVariant: data.programExactDurationVariant,
    };
  }

  @override
  BrandServicePriceDefault fromJson(Map<String, dynamic> json) {
    return BrandServicePriceDefault(
      id: json[_Fields.id],
      brandServiceCurrency: BrandServiceCurrencyMapper().fromJson(
        json[_Fields.currency],
      ),
      code: json[_Fields.code],
      created: json[_Fields.created],
      updated: json[_Fields.updated],
      isActive: json[_Fields.isActive],
      name: json[_Fields.name] ?? '',
      value: json[_Fields.value],
      isPriceDependsOnQuantity: json[_Fields.isPriceDependsOnQuantity],
      isPriceDependsOnWeekdayTime: json[_Fields.isPriceDependsOnWeekdayTime],
      dateStart: json[_Fields.dateStart],
      programExactDurationVariant: json[_Fields.programExactDurationVariant],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String currency = 'currency';
  static const String code = 'code';
  static const String created = 'created';
  static const String updated = 'updated';
  static const String isActive = 'is_active';
  static const String name = 'name';
  static const String value = 'value';
  static const String isPriceDependsOnQuantity = 'is_price_depends_on_quantity';
  static const String isPriceDependsOnWeekdayTime =
      'is_price_depends_on_weekday_time';
  static const String dateStart = 'date_start';
  static const String programExactDurationVariant =
      'program_exact_duration_variant';
}
