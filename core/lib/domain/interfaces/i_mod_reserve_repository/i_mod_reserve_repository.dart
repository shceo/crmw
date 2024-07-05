import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';

abstract interface class IModReserveRepository {
  Stream<List<BrandServiceType>?> get brandServiceTypeStream;

  Stream<List<BrandServiceAddress>?> get brandServiceAddressStream;

  Stream<List<BrandServiceProgramme>?> get brandServiceProgrammeStream;

  Stream<List<BrandServiceDetailProgramme>?>
      get brandServiceDetailProgrammeStream;

  Stream<List<BrandServiceDenomination>?> get brandServiceDenominationStream;

  Stream<List<BrandServiceDate>?> get brandServiceDateStream;

  Stream<List<BrandServiceTimeSlot>?> get brandServiceTimeSlotStream;

  Future<void> getBrandServiceType();

  Future<void> getBrandServiceAddress({required int categoryId});

  Future<void> getBrandServiceProgrammeByAddress({
    required int categoryId,
    required int addressId,
  });

  Future<void> getBrandServiceDetailProgramme({
    required int categoryId,
    required int programmeId,
  });

  Future<void> getBrandServiceDenomination({
    required int programmeExactItemId,
  });

  Future<void> getBrandServiceDate({
    required int programmeId,
    required int addressId,
  });

  Future<void> getTimeSlot({
    required int programmeExactItemId,
    required TimeSlot timeSlot,
  });

  void clearBrandServiceType();

  void clearBrandServiceAddress();

  void clearBrandServiceProgrammeByAddress();

  void clearBrandServiceDetailProgramme();

  void clearBrandServiceDenomination();

  void clearBrandServiceDate();

  void clearTimeSlot();
}
