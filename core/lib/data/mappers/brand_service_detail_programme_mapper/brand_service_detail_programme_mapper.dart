// BrandServiceDetailProgramme

import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_photos_mapper.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_program_exact_duration.dart';
import 'package:core/data/mappers/brand_service_mapper/brand_service_videos_mapper.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';

final class BrandServiceDetailProgrammeMapper
    implements BaseMapper<BrandServiceDetailProgramme> {
  @override
  Map<String, dynamic> toJson(BrandServiceDetailProgramme data) {
    return {
      _Fields.id: data.id,
      _Fields.code: data.code,
      _Fields.name: data.name,
      _Fields.description: data.description,
      _Fields.individualType: data.individualType,
      _Fields.regularType: data.regularType,
      _Fields.isLimitResourceNumber: data.isLimitResourceNumber,
      _Fields.maxProgramGroupsQuantities: data.maxProgramGroupsQuantities,
      _Fields.hoursToSendNotification: data.hoursToSendNotification,
      _Fields.isNoteTimeSelecting: data.isNoteTimeSelecting,
      _Fields.noteTimeSelectingText: data.noteTimeSelectingText,
      _Fields.slotSelectionMode: data.slotSelectionMode,
      _Fields.slotName: data.slotName,
      _Fields.isBookingAllowed: data.isBookingAllowed,
      _Fields.isCertificateSellingAllowed: data.isCertificateSellingAllowed,
      _Fields.isBookingSellingAllowed: data.isBookingSellingAllowed,
      _Fields.brandServiceProgramExactDuration:
          data.brandServiceProgramExactDuration,
      _Fields.minProgramResourcesQuantities: data.minProgramResourcesQuantities,
      _Fields.maxProgramResourcesQuantities: data.maxProgramGroupsQuantities,
      _Fields.announce: data.announce,
      _Fields.isShowTimeRange: data.isShowTimeRange,
      _Fields.isCommonTime: data.isCommonTime,
      _Fields.brandServicePhotos: data.brandServicePhotos,
      _Fields.brandServiceVideos: data.brandServiceVideos,
    };
  }

  @override
  BrandServiceDetailProgramme fromJson(Map<String, dynamic> json) {
    final jsonBrandServiceProgramExactDuration =
        json[_Fields.brandServiceProgramExactDuration];

    final jsonBrandServicePhotos = json[_Fields.brandServicePhotos];
    final jsonBrandServiceVideos = json[_Fields.brandServiceVideos];

    return BrandServiceDetailProgramme(
      id: json[_Fields.id],
      code: json[_Fields.code],
      name: json[_Fields.name],
      description: json[_Fields.description],
      individualType: json[_Fields.individualType],
      regularType: json[_Fields.regularType],
      isLimitResourceNumber: json[_Fields.isLimitResourceNumber],
      hoursToSendNotification: json[_Fields.hoursToSendNotification],
      isNoteTimeSelecting: json[_Fields.isNoteTimeSelecting],
      noteTimeSelectingText: json[_Fields.noteTimeSelectingText],
      slotSelectionMode: json[_Fields.slotSelectionMode],
      slotName: json[_Fields.slotName],
      isBookingAllowed: json[_Fields.isBookingAllowed],
      isCertificateSellingAllowed: json[_Fields.isCertificateSellingAllowed],
      isBookingSellingAllowed: json[_Fields.isBookingSellingAllowed],
      brandServiceProgramExactDuration: jsonBrandServiceProgramExactDuration
              is List<dynamic>
          ? jsonBrandServiceProgramExactDuration
              .map((e) => BrandServiceProgramExactDurationMapper().fromJson(e))
              .toList()
          : [
              BrandServiceProgramExactDurationMapper()
                  .fromJson(jsonBrandServiceProgramExactDuration),
            ],
      isShowTimeRange: json[_Fields.isShowTimeRange],
      isCommonTime: json[_Fields.isCommonTime],
      brandServicePhotos: jsonBrandServicePhotos is List<dynamic>
          ? jsonBrandServicePhotos
              .map((e) => BrandServicePhotosMapper().fromJson(e))
              .toList()
          : [
              BrandServicePhotosMapper().fromJson(jsonBrandServicePhotos),
            ],
      maxProgramGroupsQuantities: json[_Fields.maxProgramGroupsQuantities],
      minProgramResourcesQuantities:
          json[_Fields.minProgramResourcesQuantities],
      maxProgramResourcesQuantities:
          json[_Fields.maxProgramResourcesQuantities],
      announce: json[_Fields.announce],
      brandServiceVideos: jsonBrandServiceVideos is List<dynamic>
          ? jsonBrandServiceVideos
              .map((e) => BrandServiceVideosMapper().fromJson(e))
              .toList()
          : [
              BrandServiceVideosMapper().fromJson(jsonBrandServiceVideos),
            ],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String description = 'description';
  static const String individualType = 'individual_type';
  static const String regularType = 'regular_type';
  static const String isLimitResourceNumber = 'is_limit_resource_number';
  static const String maxProgramGroupsQuantities =
      'max_program_groups_quantities';
  static const String hoursToSendNotification = 'hours_to_send_notification';
  static const String isNoteTimeSelecting = 'is_note_time_selecting';
  static const String noteTimeSelectingText = 'note_time_selecting_text';
  static const String slotSelectionMode = 'slot_selection_mode';
  static const String slotName = 'slot_name';
  static const String isBookingAllowed = 'is_booking_allowed';
  static const String isCertificateSellingAllowed =
      'is_certificate_selling_allowed';
  static const String isBookingSellingAllowed = 'is_booking_selling_allowed';
  static const String brandServiceProgramExactDuration =
      'program_exact_duration';
  static const String minProgramResourcesQuantities =
      'min_program_resources_quantities';
  static const String maxProgramResourcesQuantities =
      'max_program_resources_quantities';
  static const String announce = 'announce';
  static const String isShowTimeRange = 'is_show_time_range';
  static const String isCommonTime = 'is_common_time';
  static const String brandServicePhotos = 'photos';
  static const String brandServiceVideos = 'videos';
}
