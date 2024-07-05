import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_price.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceTimeSlotVariant extends DomainObject {
  final int id;
  final String code;
  final String name;
  final int freeResourceCount;
  final BrandServiceTimeSlotPrice? price;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        freeResourceCount,
        price,
      ];

  const BrandServiceTimeSlotVariant({
    required this.id,
    required this.code,
    required this.name,
    required this.freeResourceCount,
    this.price,
  });

  @override
  BrandServiceTimeSlotVariant copyWith() {
    return BrandServiceTimeSlotVariant(
      id: id,
      code: code,
      name: name,
      freeResourceCount: freeResourceCount,
      price: price,
    );
  }
}
