import 'package:core/data/data_sources/interfaces/i_mod_reserve_data_source.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';
import 'package:core/domain/interfaces/i_mod_reserve_repository/i_mod_reserve_repository.dart';

final class ModReserveRepository implements IModReserveRepository {
  final IModReserveDataSource _modReserveDataSource;

  ModReserveRepository(this._modReserveDataSource);

  @override
  Stream<List<BrandServiceType>?> get brandServiceTypeStream =>
      _modReserveDataSource.brandServiceTypeStream;

  @override
  Stream<List<BrandServiceAddress>?> get brandServiceAddressStream =>
      _modReserveDataSource.brandServiceAddressStream;

  @override
  Stream<List<BrandServiceProgramme>?> get brandServiceProgrammeStream =>
      _modReserveDataSource.brandServiceProgrammeStream;

  @override
  Stream<List<BrandServiceDetailProgramme>?>
      get brandServiceDetailProgrammeStream =>
          _modReserveDataSource.brandServiceDetailProgrammeStream;

  @override
  Stream<List<BrandServiceDenomination>?> get brandServiceDenominationStream =>
      _modReserveDataSource.brandServiceDenominationStream;

  @override
  Stream<List<BrandServiceDate>?> get brandServiceDateStream =>
      _modReserveDataSource.brandServiceDateStream;

  @override
  Stream<List<BrandServiceTimeSlot>?> get brandServiceTimeSlotStream =>
      _modReserveDataSource.brandServiceTimeSlotStream;

  @override
  Future<void> getBrandServiceType() {
    return _modReserveDataSource.getBrandServiceTypes();
  }

  @override
  Future<void> getBrandServiceAddress({required int categoryId}) {
    return _modReserveDataSource.getBrandServiceAddress(
      categoryId: categoryId,
    );
  }

  @override
  Future<void> getBrandServiceProgrammeByAddress({
    required int categoryId,
    required int addressId,
  }) {
    return _modReserveDataSource.getBrandServiceProgrammeByAddress(
      categoryId: categoryId,
      addressId: addressId,
    );
  }

  @override
  Future<void> getBrandServiceDetailProgramme({
    required int categoryId,
    required int programmeId,
  }) {
    return _modReserveDataSource.getBrandServiceDetailProgramme(
      categoryId: categoryId,
      programmeId: programmeId,
    );
  }

  @override
  Future<void> getBrandServiceDenomination({
    required int programmeExactItemId,
  }) {
    return _modReserveDataSource.getBrandServiceDenomination(
      programmeExactItemId: programmeExactItemId,
    );
  }

  @override
  Future<void> getBrandServiceDate({
    required int programmeId,
    required int addressId,
  }) {
    return _modReserveDataSource.getBrandServiceDate(
      programmeId: programmeId,
      addressId: addressId,
    );
  }

  @override
  Future<void> getTimeSlot({
    required int programmeExactItemId,
    required TimeSlot timeSlot,
  }) {
    return _modReserveDataSource.getTimeSlot(
      programmeExactItemId: programmeExactItemId,
      timeSlot: timeSlot,
    );
  }

  @override
  void clearBrandServiceType() {
    _modReserveDataSource.clearBrandServiceTypes();
  }

  @override
  void clearBrandServiceAddress() {
    _modReserveDataSource.clearBrandServiceAddress();
  }

  @override
  void clearBrandServiceProgrammeByAddress() {
    _modReserveDataSource.clearBrandServiceProgrammeByAddress();
  }

  @override
  void clearBrandServiceDetailProgramme() {
    _modReserveDataSource.clearBrandServiceDetailProgramme();
  }

  @override
  void clearBrandServiceDenomination() {
    _modReserveDataSource.clearBrandServiceDenomination();
  }

  @override
  void clearBrandServiceDate() {
    _modReserveDataSource.clearBrandServiceDate();
  }

  @override
  void clearTimeSlot() {
    _modReserveDataSource.clearTimeSlot();
  }
}
