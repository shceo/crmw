import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_currency.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceTimeSlotPrice extends DomainObject {
  final int value;
  final BrandServiceTimeSlotCurrency currency;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        value,
        currency,
      ];

  const BrandServiceTimeSlotPrice({
    required this.value,
    required this.currency,
  });

  @override
  BrandServiceTimeSlotPrice copyWith() {
    return BrandServiceTimeSlotPrice(
      value: value,
      currency: currency,
    );
  }
}
