import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_type/service_type.dart';

final class ServiceTypeMapper implements BaseMapper<ServiceType> {
  @override
  Map<String, dynamic> toJson(ServiceType data) {
    return {
      _Fields.name: data.name,
      _Fields.image: data.image,
    };
  }

  @override
  ServiceType fromJson(Map<String, dynamic> json) {
    return ServiceType(
      name: json[_Fields.name],
      image: json[_Fields.image],
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
  static const String image = 'image';
}
