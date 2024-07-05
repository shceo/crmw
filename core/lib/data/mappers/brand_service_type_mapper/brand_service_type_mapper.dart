import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_type_mapper/service_type_mapper.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';

final class BrandServiceTypeMapper implements BaseMapper<BrandServiceType> {
  @override
  Map<String, dynamic> toJson(BrandServiceType data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.serviceType: data.serviceType,
      _Fields.isActive: data.isActive,
    };
  }

  @override
  BrandServiceType fromJson(Map<String, dynamic> json) {
    return BrandServiceType(
      id: json[_Fields.id],
      code: json[_Fields.code],
      serviceType: ServiceTypeMapper().fromJson(
        json[_Fields.serviceType],
      ),
      isActive: json[_Fields.isActive],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String serviceType = 'service_type';
  static const String isActive = 'is_active';
}
