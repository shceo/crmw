import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceAddressCity extends DomainObject {
  final String name;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
      ];

  const BrandServiceAddressCity({
    required this.name,
  });

  @override
  BrandServiceAddressCity copyWith() {
    return BrandServiceAddressCity(
      name: name,
    );
  }
}
