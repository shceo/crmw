import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_currency.dart';

final class BrandServiceCurrencyMapper
    implements BaseMapper<BrandServiceCurrency> {
  @override
  Map<String, dynamic> toJson(BrandServiceCurrency data) {
    return {
      _Fields.name: data.name,
      _Fields.symbol: data.symbol,
    };
  }

  @override
  BrandServiceCurrency fromJson(Map<String, dynamic> json) {
    return BrandServiceCurrency(
      name: json[_Fields.name],
      symbol: json[_Fields.symbol],
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
  static const String symbol = 'symbol';
}
