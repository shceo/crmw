import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address_city.dart';

final class BrandServiceAddressCityMapper
    implements BaseMapper<BrandServiceAddressCity> {
  @override
  Map<String, dynamic> toJson(BrandServiceAddressCity data) {
    return {
      _Fields.name: data.name,
    };
  }

  @override
  BrandServiceAddressCity fromJson(Map<String, dynamic> json) {
    return BrandServiceAddressCity(
      name: json[_Fields.name],
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
}
