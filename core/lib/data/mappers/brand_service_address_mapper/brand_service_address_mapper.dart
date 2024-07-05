import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_address_mapper/brand_service_address_city_mapper.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';

final class BrandServiceAddressMapper
    implements BaseMapper<BrandServiceAddress> {
  @override
  Map<String, dynamic> toJson(BrandServiceAddress data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.city: data.city,
      _Fields.isActive: data.isActive,
    };
  }

  @override
  BrandServiceAddress fromJson(Map<String, dynamic> json) {
    return BrandServiceAddress(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      city: BrandServiceAddressCityMapper().fromJson(
        json[_Fields.city],
      ),
      isActive: json[_Fields.isActive],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String city = 'city';
  static const String isActive = 'is_active';
}
