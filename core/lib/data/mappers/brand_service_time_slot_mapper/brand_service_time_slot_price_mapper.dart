import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_time_slot_mapper/brand_service_time_slot_currency_mapper.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_price.dart';

final class BrandServiceTimeSlotPriceMapper
    implements BaseMapper<BrandServiceTimeSlotPrice> {
  @override
  Map<String, dynamic> toJson(BrandServiceTimeSlotPrice data) {
    return {
      _Fields.value: data.value,
      _Fields.currency: BrandServiceTimeSlotCurrencyMapper().toJson(
        data.currency,
      ),
    };
  }

  @override
  BrandServiceTimeSlotPrice fromJson(Map<String, dynamic> json) {
    return BrandServiceTimeSlotPrice(
      value: json[_Fields.value],
      currency: BrandServiceTimeSlotCurrencyMapper().fromJson(
        json[_Fields.currency],
      ),
    );
  }
}

abstract final class _Fields {
  static const String value = 'value';
  static const String currency = 'currency';
}
