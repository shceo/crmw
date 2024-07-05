import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/time_slot/time_slot_variant.dart';

final class TimeSlotVariantMapper implements BaseMapper<TimeSlotVariant> {
  @override
  Map<String, dynamic> toJson(TimeSlotVariant data) {
    return {
      _Fields.id: data.id,
      _Fields.count: data.count,
    };
  }

  @override
  TimeSlotVariant fromJson(Map<String, dynamic> json) {
    return TimeSlotVariant(
      id: json[_Fields.id],
      count: json[_Fields.count],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String count = 'count';
}
