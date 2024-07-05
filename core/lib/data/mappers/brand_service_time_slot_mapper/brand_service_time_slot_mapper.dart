import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_time_slot_mapper/brand_service_time_slot_variant_mapper.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';

final class BrandServiceTimeSlotMapper
    implements BaseMapper<BrandServiceTimeSlot> {
  @override
  Map<String, dynamic> toJson(BrandServiceTimeSlot data) {
    return {};
  }

  @override
  BrandServiceTimeSlot fromJson(Map<String, dynamic> json) {
    final jsonVariants = json[_Fields.variants];

    return BrandServiceTimeSlot(
      id: json[_Fields.id],
      code: json[_Fields.code],
      address: json[_Fields.address],
      datetimeStart: json[_Fields.datetimeStart],
      datetimeEnd: json[_Fields.datetimeEnd],
      intervalMinutes: json[_Fields.intervalMinutes],
      isDisabled: json[_Fields.isDisabled],
      variants: jsonVariants is List<dynamic>
          ? jsonVariants
              .map((e) => BrandServiceTimeSlotVariantMapper().fromJson(e))
              .toList()
          : [
              BrandServiceTimeSlotVariantMapper().fromJson(jsonVariants),
            ],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String address = 'address';
  static const String datetimeStart = 'datetime_start';
  static const String datetimeEnd = 'datetime_end';
  static const String intervalMinutes = 'interval_minutes';
  static const String isDisabled = 'is_disabled';
  static const String variants = 'variants';
}
