import 'package:core/domain/entities/brand_service_programme/brand_service_currency.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServicePriceDefault extends DomainObject {
  final int id;
  final BrandServiceCurrency brandServiceCurrency;
  final String code;
  final String created;
  final String updated;
  final bool isActive;
  final String? name;
  final String? value;
  final bool isPriceDependsOnQuantity;
  final bool isPriceDependsOnWeekdayTime;
  final String? dateStart;
  final int? programExactDurationVariant;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        brandServiceCurrency,
        code,
        created,
        updated,
        isActive,
        name,
        value,
        isPriceDependsOnQuantity,
        isPriceDependsOnWeekdayTime,
        dateStart,
        programExactDurationVariant,
      ];

  const BrandServicePriceDefault({
    required this.id,
    required this.brandServiceCurrency,
    required this.code,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.isPriceDependsOnQuantity,
    required this.isPriceDependsOnWeekdayTime,
    this.value,
    this.dateStart,
    this.programExactDurationVariant,
    this.name,
  });

  @override
  BrandServicePriceDefault copyWith() {
    return BrandServicePriceDefault(
      id: id,
      brandServiceCurrency: brandServiceCurrency,
      code: code,
      created: created,
      updated: updated,
      isActive: isActive,
      value: value,
      isPriceDependsOnQuantity: isPriceDependsOnQuantity,
      isPriceDependsOnWeekdayTime: isPriceDependsOnWeekdayTime,
      dateStart: dateStart,
      programExactDurationVariant: programExactDurationVariant,
      name: name,
    );
  }
}
