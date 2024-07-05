import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_currency.dart';

final class BrandServiceTimeSlotCurrencyMapper
    implements BaseMapper<BrandServiceTimeSlotCurrency> {
  @override
  Map<String, dynamic> toJson(BrandServiceTimeSlotCurrency data) {
    return {
      _Fields.name : data.name,
      _Fields.symbol : data.symbol,
    };
  }

  @override
  BrandServiceTimeSlotCurrency fromJson(Map<String, dynamic> json) {
    return BrandServiceTimeSlotCurrency(
      name: json[_Fields.name],
      symbol: json[_Fields.symbol],
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
  static const String symbol = 'symbol';
}
