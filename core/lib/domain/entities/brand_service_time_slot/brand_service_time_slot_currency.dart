import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceTimeSlotCurrency extends DomainObject {
  final String name;
  final String symbol;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        symbol,
      ];

  const BrandServiceTimeSlotCurrency({
    required this.name,
    required this.symbol,
  });

  @override
  BrandServiceTimeSlotCurrency copyWith() {
    return BrandServiceTimeSlotCurrency(
      name: name,
      symbol: symbol,
    );
  }
}
