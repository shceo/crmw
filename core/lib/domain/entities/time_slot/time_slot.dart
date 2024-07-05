import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/time_slot/time_slot_variant.dart';

final class TimeSlot extends DomainObject {
  final String address;
  final String date;
  final List<TimeSlotVariant> variants;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        address,
        date,
        variants,
      ];

  const TimeSlot({
    required this.address,
    required this.date,
    required this.variants,
  });

  @override
  TimeSlot copyWith() {
    return TimeSlot(
      address: address,
      date: date,
      variants: variants,
    );
  }
}
