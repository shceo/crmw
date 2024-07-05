import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';
import 'package:core/domain/interfaces/i_mod_reserve_repository/i_mod_reserve_repository.dart';

final class ModReserveInteractor {
  final IModReserveRepository _modReserveRepository;

  ModReserveInteractor(this._modReserveRepository);

  // 1.0 STREAM
  Stream<List<BrandServiceType>?> get brandServiceTypeStream =>
      _modReserveRepository.brandServiceTypeStream;

  // 2.0 STREAM
  Stream<List<BrandServiceAddress>?> get brandServiceAddressStream =>
      _modReserveRepository.brandServiceAddressStream;

  // 3.2 STREAM
  Stream<List<BrandServiceProgramme>?> get brandServiceProgrammeStream =>
      _modReserveRepository.brandServiceProgrammeStream;

  // 3.1 STREAM
  Stream<List<BrandServiceDetailProgramme>?>
      get brandServiceDetailProgrammeStream =>
          _modReserveRepository.brandServiceDetailProgrammeStream;

  // 4.0 STREAM
  Stream<List<BrandServiceDenomination>?> get brandServiceDenominationStream =>
      _modReserveRepository.brandServiceDenominationStream;

  // 5.0 STREAM
  Stream<List<BrandServiceDate>?> get brandServiceDateStream =>
      _modReserveRepository.brandServiceDateStream;

  // 6.0 STREAM
  Stream<List<BrandServiceTimeSlot>?> get brandServiceTimeSlotStream =>
      _modReserveRepository.brandServiceTimeSlotStream;

  // 1.0 METHOD
  Future<void> getBrandServiceType() {
    return _modReserveRepository.getBrandServiceType();
  }

  // 2.0 METHOD
  Future<void> getBrandServiceAddress({required int categoryId}) {
    return _modReserveRepository.getBrandServiceAddress(
      categoryId: categoryId,
    );
  }

  // 3.2 METHOD
  Future<void> getBrandServiceProgrammeByAddress({
    required int categoryId,
    required int addressId,
  }) {
    return _modReserveRepository.getBrandServiceProgrammeByAddress(
      categoryId: categoryId,
      addressId: addressId,
    );
  }

  // 3.1 METHOD
  Future<void> getBrandServiceDetailProgramme({
    required int categoryId,
    required int programmeId,
  }) {
    return _modReserveRepository.getBrandServiceDetailProgramme(
      categoryId: categoryId,
      programmeId: programmeId,
    );
  }

  // 4.0 METHOD
  Future<void> getBrandServiceDenomination({
    required int programmeExactItemId,
  }) {
    return _modReserveRepository.getBrandServiceDenomination(
      programmeExactItemId: programmeExactItemId,
    );
  }

  // 5.0 METHOD
  Future<void> getBrandServiceDate({
    required int programmeId,
    required int addressId,
  }) {
    return _modReserveRepository.getBrandServiceDate(
      programmeId: programmeId,
      addressId: addressId,
    );
  }

  // 6.0 METHOD
  Future<void> getTimeSlot({
    required int programmeExactItemId,
    required TimeSlot timeSlot,
  }) {
    return _modReserveRepository.getTimeSlot(
      programmeExactItemId: programmeExactItemId,
      timeSlot: timeSlot,
    );
  }

  void clearBrandServiceType() {
    _modReserveRepository.clearBrandServiceType();
  }

  void clearBrandServiceAddress() {
    _modReserveRepository.clearBrandServiceAddress();
  }

  void clearBrandServiceProgrammeByAddress() {
    _modReserveRepository.clearBrandServiceProgrammeByAddress();
  }

  void clearBrandServiceDetailProgramme() {
    _modReserveRepository.clearBrandServiceDetailProgramme();
  }

  void clearBrandServiceDenomination() {
    _modReserveRepository.clearBrandServiceDenomination();
  }

  void clearBrandServiceDate() {
    _modReserveRepository.clearBrandServiceDate();
  }
}
