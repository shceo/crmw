import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceProgramDuration extends DomainObject {
  final String value;
  final int unit;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        value,
        unit,
      ];

  const BrandServiceProgramDuration({
    required this.value,
    required this.unit,
  });

  @override
  BrandServiceProgramDuration copyWith() {
    return BrandServiceProgramDuration(
      value: value,
      unit: unit,
    );
  }
}
