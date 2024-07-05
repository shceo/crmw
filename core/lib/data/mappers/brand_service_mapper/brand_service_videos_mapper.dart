import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_videos.dart';

final class BrandServiceVideosMapper implements BaseMapper<BrandServiceVideos> {
  @override
  Map<String, dynamic> toJson(BrandServiceVideos data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.video: data.video,
      _Fields.isActive: data.isActive,
    };
  }

  @override
  BrandServiceVideos fromJson(Map<String, dynamic> json) {
    return BrandServiceVideos(
      id: json[_Fields.id],
      code: json[_Fields.code],
      video: json[_Fields.video],
      isActive: json[_Fields.isActive],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String video = 'video';
  static const String isActive = 'is_active';
}
