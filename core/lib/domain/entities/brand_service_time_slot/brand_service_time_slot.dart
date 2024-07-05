import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_variant.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceTimeSlot extends DomainObject {
  final int id;
  final String code;
  final int address;
  final String datetimeStart;
  final String datetimeEnd;
  final int intervalMinutes;
  final bool isDisabled;
  final List<BrandServiceTimeSlotVariant> variants;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        address,
        datetimeStart,
        datetimeEnd,
        intervalMinutes,
        isDisabled,
        variants,
      ];

  const BrandServiceTimeSlot({
    required this.id,
    required this.code,
    required this.address,
    required this.datetimeStart,
    required this.datetimeEnd,
    required this.intervalMinutes,
    required this.isDisabled,
    required this.variants,
  });

  @override
  BrandServiceTimeSlot copyWith() {
    return BrandServiceTimeSlot(
      id: id,
      code: code,
      address: address,
      datetimeStart: datetimeStart,
      datetimeEnd: datetimeEnd,
      intervalMinutes: intervalMinutes,
      isDisabled: isDisabled,
      variants: variants,
    );
  }
}
