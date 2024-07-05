import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceVariantType extends DomainObject {
  final int id;
  final String code;
  final String name;
  final String slug;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        slug,
      ];

  const BrandServiceVariantType({
    required this.id,
    required this.code,
    required this.name,
    required this.slug,
  });

  @override
  BrandServiceVariantType copyWith() {
    return BrandServiceVariantType(
      id: id,
      code: code,
      name: name,
      slug: slug,
    );
  }
}
