import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceVariantTag extends DomainObject {
  final int? id;
  final String? code;
  final String? name;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
      ];

  const BrandServiceVariantTag({
    this.id,
    this.code,
    this.name,
  });

  @override
  BrandServiceVariantTag copyWith() {
    return BrandServiceVariantTag(
      id: id,
      code: code,
      name: name,
    );
  }
}
