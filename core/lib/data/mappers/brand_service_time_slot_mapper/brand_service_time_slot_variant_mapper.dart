import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_time_slot_mapper/brand_service_time_slot_price_mapper.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_variant.dart';

final class BrandServiceTimeSlotVariantMapper
    implements BaseMapper<BrandServiceTimeSlotVariant> {
  @override
  Map<String, dynamic> toJson(BrandServiceTimeSlotVariant data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.freeResourceCount: data.freeResourceCount,
      _Fields.price: BrandServiceTimeSlotPriceMapper().toJson(
        data.price!,
      ),
    };
  }

  @override
  BrandServiceTimeSlotVariant fromJson(Map<String, dynamic> json) {
    final jsonPrice = json[_Fields.price];
    return BrandServiceTimeSlotVariant(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      freeResourceCount: json[_Fields.freeResourceCount],
      price: jsonPrice != null
          ? BrandServiceTimeSlotPriceMapper().fromJson(
              jsonPrice,
            )
          : null,
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String freeResourceCount = 'free_resources_count';
  static const String price = 'price';
}
