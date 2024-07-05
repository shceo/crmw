import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/time_slot_mapper/time_slot_variant_mapper.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';

final class TimeSlotMapper implements BaseMapper<TimeSlot> {
  @override
  Map<String, dynamic> toJson(TimeSlot data) {
    return {
      _Fields.address: data.address,
      _Fields.date: data.date,
      _Fields.variants: data.variants
          .map(
            (e) => TimeSlotVariantMapper().toJson(e),
          )
          .toList(),
    };
  }

  @override
  TimeSlot fromJson(Map<String, dynamic> json) {
    final jsonVariants = json[_Fields.variants];

    return TimeSlot(
      address: json[_Fields.address],
      date: json[_Fields.date],
      variants: jsonVariants is List<dynamic>
          ? jsonVariants
              .map((e) => TimeSlotVariantMapper().fromJson(e))
              .toList()
          : [
              TimeSlotVariantMapper().fromJson(jsonVariants),
            ],
    );
  }
}

abstract final class _Fields {
  static const String address = 'address';
  static const String date = 'date';
  static const String variants = 'variants';
}
