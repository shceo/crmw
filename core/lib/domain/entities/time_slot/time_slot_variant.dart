import 'package:core/domain/entities/domain_object.dart';

final class TimeSlotVariant extends DomainObject {
  final int id;
  final int count;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        count,
      ];

  const TimeSlotVariant({required this.id, required this.count});

  @override
  TimeSlotVariant copyWith() {
    return TimeSlotVariant(
      id: id,
      count: count,
    );
  }
}
