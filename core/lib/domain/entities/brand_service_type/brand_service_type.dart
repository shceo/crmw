import 'package:core/domain/entities/brand_service_type/service_type.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceType extends DomainObject {
  final int id;
  final String code;
  final ServiceType serviceType;
  final bool isActive;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        serviceType,
        isActive,
      ];

  const BrandServiceType({
    required this.id,
    required this.code,
    required this.serviceType,
    required this.isActive,
  });

  @override
  BrandServiceType copyWith() {
    return BrandServiceType(
      id: id,
      code: code,
      serviceType: serviceType,
      isActive: isActive,
    );
  }
}
