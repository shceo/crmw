import 'package:core/domain/entities/domain_object.dart';

final class BrandServicePhotos extends DomainObject {
  final int id;
  final String code;
  final String image;
  final bool isActive;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        image,
        isActive,
      ];

  const BrandServicePhotos({
    required this.id,
    required this.code,
    required this.image,
    required this.isActive,
  });

  @override
  BrandServicePhotos copyWith() {
    return BrandServicePhotos(
      id: id,
      code: code,
      image: image,
      isActive: isActive,
    );
  }
}
