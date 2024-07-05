import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceCurrency extends DomainObject {
  final String? name;
  final String? symbol;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        symbol,
      ];

  const BrandServiceCurrency({
    required this.name,
    required this.symbol,
  });

  @override
  BrandServiceCurrency copyWith() {
    return BrandServiceCurrency(
      name: name,
      symbol: symbol,
    );
  }
}
