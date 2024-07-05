import 'package:core/domain/entities/brand_service_programme/brand_service_price_default.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_duration.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceProgramExactDuration extends DomainObject {
  final int id;
  final String code;
  final BrandServiceProgramDuration brandServiceProgramDuration;
  final BrandServicePriceDefault brandServicePriceDefault;
  final bool isActive;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        brandServiceProgramDuration,
        brandServicePriceDefault,
        isActive,
      ];

  const BrandServiceProgramExactDuration({
    required this.id,
    required this.code,
    required this.brandServiceProgramDuration,
    required this.brandServicePriceDefault,
    required this.isActive,
  });

  @override
  BrandServiceProgramExactDuration copyWith() {
    return BrandServiceProgramExactDuration(
      id: id,
      code: code,
      brandServiceProgramDuration: brandServiceProgramDuration,
      brandServicePriceDefault: brandServicePriceDefault,
      isActive: isActive,
    );
  }
}
