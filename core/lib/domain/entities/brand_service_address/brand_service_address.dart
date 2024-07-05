import 'package:core/domain/entities/brand_service_address/brand_service_address_city.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceAddress extends DomainObject {
  final int id;
  final String code;
  final String name;
  final BrandServiceAddressCity city;
  final bool isActive;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        city,
        isActive,
      ];

  const BrandServiceAddress({
    required this.id,
    required this.code,
    required this.name,
    required this.city,
    required this.isActive,
  });

  @override
  BrandServiceAddress copyWith() {
    return BrandServiceAddress(
      id: id,
      code: code,
      name: name,
      city: city,
      isActive: isActive,
    );
  }
}
