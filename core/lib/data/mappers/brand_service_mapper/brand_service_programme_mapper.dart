import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_photos_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_program_exact_duration.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_videos_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';

final class BrandServiceProgrammeMapper
    implements BaseMapper<BrandServiceProgramme> {
  @override
  Map<String, dynamic> toJson(BrandServiceProgramme data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.description: data.description,
      _Fields.programExactDuration: data.brandServiceProgramExactDuration,
      _Fields.photos: data.brandServicePhotos,
      _Fields.videos: data.brandServiceVideos,
    };
  }

  @override
  BrandServiceProgramme fromJson(Map<String, dynamic> json) {
    final jsonBrandServiceProgramExactDuration =
        json[_Fields.programExactDuration];

    final jsonBrandServicePhotos = json[_Fields.photos];
    final jsonBrandServiceVideos = json[_Fields.videos];

    return BrandServiceProgramme(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      description: json[_Fields.description],
      brandServiceProgramExactDuration: jsonBrandServiceProgramExactDuration
              is List<dynamic>
          ? jsonBrandServiceProgramExactDuration
              .map((e) => BrandServiceProgramExactDurationMapper().fromJson(e))
              .toList()
          : [
              BrandServiceProgramExactDurationMapper()
                  .fromJson(jsonBrandServiceProgramExactDuration),
            ],
      brandServicePhotos: jsonBrandServicePhotos is List<dynamic>
          ? jsonBrandServicePhotos
              .map((e) => BrandServicePhotosMapper().fromJson(e))
              .toList()
          : [
              BrandServicePhotosMapper().fromJson(jsonBrandServicePhotos),
            ],
      brandServiceVideos: jsonBrandServiceVideos is List<dynamic>
          ? jsonBrandServiceVideos
              .map((e) => BrandServiceVideosMapper().fromJson(e))
              .toList()
          : [
              BrandServiceVideosMapper().fromJson(jsonBrandServiceVideos),
            ],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String description = 'description';
  static const String programExactDuration = 'program_exact_duration';
  static const String photos = 'photos';
  static const String videos = 'videos';
}
