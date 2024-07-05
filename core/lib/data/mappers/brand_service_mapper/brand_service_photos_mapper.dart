import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_photos.dart';

final class BrandServicePhotosMapper implements BaseMapper<BrandServicePhotos> {
  @override
  Map<String, dynamic> toJson(BrandServicePhotos data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.image: data.image,
      _Fields.isActive: data.isActive,
    };
  }

  @override
  BrandServicePhotos fromJson(Map<String, dynamic> json) {
    return BrandServicePhotos(
      id: json[_Fields.id],
      code: json[_Fields.code],
      image: json[_Fields.image],
      isActive: json[_Fields.isActive],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String image = 'image';
  static const String isActive = 'is_active';
}
