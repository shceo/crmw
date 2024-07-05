import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceDate extends DomainObject {
  final String date;
  final int day;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        date,
        day,
      ];

  const BrandServiceDate({required this.date, required this.day});

  @override
  BrandServiceDate copyWith() {
    return BrandServiceDate(
      date: date,
      day: day,
    );
  }
}
