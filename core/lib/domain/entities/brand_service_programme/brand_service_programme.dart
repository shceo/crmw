import 'package:core/domain/entities/brand_service_programme/brand_service_photos.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_videos.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceProgramme extends DomainObject {
  final int id;
  final String code;
  final String name;
  final String description;
  final List<BrandServiceProgramExactDuration> brandServiceProgramExactDuration;
  final List<BrandServicePhotos> brandServicePhotos;
  final List<BrandServiceVideos>? brandServiceVideos;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        description,
        brandServiceProgramExactDuration,
        brandServicePhotos,
        brandServiceVideos,
      ];

  const BrandServiceProgramme({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.brandServiceProgramExactDuration,
    required this.brandServicePhotos,
    this.brandServiceVideos,
  });

  @override
  BrandServiceProgramme copyWith() {
    return BrandServiceProgramme(
      id: id,
      code: code,
      name: name,
      description: description,
      brandServiceProgramExactDuration: brandServiceProgramExactDuration,
      brandServicePhotos: brandServicePhotos,
      brandServiceVideos: brandServiceVideos,
    );
  }
}
