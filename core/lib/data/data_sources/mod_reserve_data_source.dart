import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_mod_reserve_data_source.dart';
import 'package:core/data/mappers/brand_service_address_mapper/brand_service_address_mapper.dart';
import 'package:core/data/mappers/brand_service_date_mapper/brand_service_date_mapper.dart';
import 'package:core/data/mappers/brand_service_denomination_mapper/brand_service_denomination_mapper.dart';
import 'package:core/data/mappers/brand_service_detail_programme_mapper/brand_service_detail_programme_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_programme_mapper.dart';
import 'package:core/data/mappers/brand_service_time_slot_mapper/brand_service_time_slot_mapper.dart';
import 'package:core/data/mappers/brand_service_type_mapper/brand_service_type_mapper.dart';
import 'package:core/data/utils/core_logger/core_logger.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class ModReserveDataSource implements IModReserveDataSource {
  final BehaviorSubject<List<BrandServiceType>?> _brandServiceTypeSubject =
      BehaviorSubject();

  final BehaviorSubject<List<BrandServiceAddress>?>
      _brandServiceAddressSubject = BehaviorSubject();

  final BehaviorSubject<List<BrandServiceProgramme>?>
      _brandServiceProgrammeSubject = BehaviorSubject();

  final BehaviorSubject<List<BrandServiceDetailProgramme>?>
      _brandServiceDetailProgrammeSubject = BehaviorSubject();

  final BehaviorSubject<List<BrandServiceDenomination>?>
      _brandServiceDenominationSubject = BehaviorSubject();

  final BehaviorSubject<List<BrandServiceDate>?> _brandServiceDateSubject =
      BehaviorSubject();

  final BehaviorSubject<List<BrandServiceTimeSlot>?>
      _brandServiceTimeSlotSubject = BehaviorSubject();

  @override
  Stream<List<BrandServiceType>?> get brandServiceTypeStream =>
      _brandServiceTypeSubject;

  @override
  Stream<List<BrandServiceAddress>?> get brandServiceAddressStream =>
      _brandServiceAddressSubject;

  @override
  Stream<List<BrandServiceProgramme>?> get brandServiceProgrammeStream =>
      _brandServiceProgrammeSubject;

  @override
  Stream<List<BrandServiceDetailProgramme>?>
      get brandServiceDetailProgrammeStream =>
          _brandServiceDetailProgrammeSubject;

  @override
  Stream<List<BrandServiceDenomination>?> get brandServiceDenominationStream =>
      _brandServiceDenominationSubject;

  @override
  Stream<List<BrandServiceDate>?> get brandServiceDateStream =>
      _brandServiceDateSubject;

  @override
  Stream<List<BrandServiceTimeSlot>?> get brandServiceTimeSlotStream =>
      _brandServiceTimeSlotSubject;

  @override
  Future<void> getBrandServiceTypes() async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: 'sb/partner/brand_service_type_for_booking/',
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final toBrandServiceList =
          toListMap.map((e) => BrandServiceTypeMapper().fromJson(e)).toList();

      _brandServiceTypeSubject.add(toBrandServiceList);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceTypes',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getBrandServiceAddress({
    required int categoryId,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: '/sb/product/brand_service_type/$categoryId/address/',
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final toListBrandServiceAddress = toListMap
          .map(
            (e) => BrandServiceAddressMapper().fromJson(e),
          )
          .toList();

      _brandServiceAddressSubject.add(toListBrandServiceAddress);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceAddress',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getBrandServiceProgrammeByAddress({
    required int categoryId,
    required int addressId,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: '/sb/product/brand_service_type/$categoryId/brand_program/',
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final toBrandServiceProgramme = toListMap
          .map((e) => BrandServiceProgrammeMapper().fromJson(e))
          .toList();

      _brandServiceProgrammeSubject.add(toBrandServiceProgramme);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceProgrammeByAddress',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getBrandServiceDetailProgramme({
    required int categoryId,
    required int programmeId,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path:
          '/sb/product/brand_service_type/$categoryId/brand_program/$programmeId/',
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toMap = jsonDecode(decodedBody) as Map<String, dynamic>;

      final toBrandDetailProgramme =
          BrandServiceDetailProgrammeMapper().fromJson(toMap);

      final brandDetailProgrammeList = <BrandServiceDetailProgramme>[];

      // ignore: cascade_invocations
      brandDetailProgrammeList.add(
        toBrandDetailProgramme,
      );

      _brandServiceDetailProgrammeSubject.add(brandDetailProgrammeList);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceDetailProgramme',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getBrandServiceDenomination({
    required int programmeExactItemId,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: '/sb/product/program_exact_duration/$programmeExactItemId/variant',
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final toBrandServiceDenomination = toListMap
          .map((e) => BrandServiceDenominationMapper().fromJson(e))
          .toList();

      _brandServiceDenominationSubject.add(toBrandServiceDenomination);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceDenomination',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getBrandServiceDate({
    required int programmeId,
    required int addressId,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: '/sb/calendar/program/$programmeId/schedule',
      queryParameters: {
        'address': '15',
        // 'address': '$addressId',
      },
    );

    final headers = {
      'Brand': '60500988',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final datesForProgram =
          toListMap.first['dates_for_program'] as List<dynamic>;

      final datesList =
          datesForProgram.map((e) => e as Map<String, dynamic>).toList();

      final brandServiceDate =
          datesList.map((e) => BrandServiceDateMapper().fromJson(e)).toList();

      _brandServiceDateSubject.add(brandServiceDate);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getBrandServiceDate',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  Future<void> getTimeSlot({
    required int programmeExactItemId,
    required TimeSlot timeSlot,
  }) async {
    final url = Uri(
      scheme: 'http',
      host: '91.218.231.117',
      path: '/sb/calendar/program_exact_duration/16/time_slot/find_time_slots/',
      // '/sb/calendar/program_exact_duration/$programmeExactItemId/time_slot/find_time_slots/',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Brand': '60500988',
    };

    // final body = json.encode(
    //   TimeSlotMapper().toJson(timeSlot),
    // );

    // TODO(dev): remove this
    final body = json.encode(
      {
        'address': '15',
        'date': '2024-03-20',
        'variants': [
          {'id': 1, 'count': 2},
          {'id': 10, 'count': 1},
        ],
      },
    );

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      final decodedBody = utf8.decode(response.bodyBytes);

      final toList = jsonDecode(decodedBody) as List<dynamic>;

      final toListMap = toList.map((e) => e as Map<String, dynamic>).toList();

      final toTimeSlot = toListMap
          .map((e) => BrandServiceTimeSlotMapper().fromJson(e))
          .toList();

      _brandServiceTimeSlotSubject.add(toTimeSlot);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught error on getTimeSlot',
        params: {
          'Caught error message': e,
        },
      );
    }
  }

  @override
  void clearBrandServiceTypes() {
    _brandServiceTypeSubject.add([]);
  }

  @override
  void clearBrandServiceAddress() {
    _brandServiceAddressSubject.add([]);
  }

  @override
  void clearBrandServiceProgrammeByAddress() {
    _brandServiceProgrammeSubject.add([]);
  }

  @override
  void clearBrandServiceDetailProgramme() {
    _brandServiceDetailProgrammeSubject.add([]);
  }

  @override
  void clearBrandServiceDenomination() {
    _brandServiceDenominationSubject.add([]);
  }

  @override
  void clearBrandServiceDate() {
    _brandServiceDateSubject.add([]);
  }

  @override
  void clearTimeSlot() {
    _brandServiceTimeSlotSubject.add([]);
  }
}
