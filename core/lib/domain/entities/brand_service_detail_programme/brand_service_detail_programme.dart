import 'package:core/domain/entities/brand_service_programme/brand_service_photos.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_videos.dart';
import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceDetailProgramme extends DomainObject {
  final int id;
  final String code;
  final String name;
  final String description;
  final int individualType;
  final int regularType;
  final bool isLimitResourceNumber;
  final int? maxProgramGroupsQuantities;
  final int hoursToSendNotification;
  final bool isNoteTimeSelecting;
  final String noteTimeSelectingText;
  final int slotSelectionMode;
  final int slotName;
  final bool isBookingAllowed;
  final bool isCertificateSellingAllowed;
  final bool isBookingSellingAllowed;
  final List<BrandServiceProgramExactDuration> brandServiceProgramExactDuration;
  // TODO(dev): create model for this params
  final List<dynamic>? minProgramResourcesQuantities;
  final List<dynamic>? maxProgramResourcesQuantities;
  final String? announce;
  final bool isShowTimeRange;
  final bool isCommonTime;
  final List<BrandServicePhotos> brandServicePhotos;
  final List<BrandServiceVideos>? brandServiceVideos;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        description,
        individualType,
        regularType,
        isLimitResourceNumber,
        maxProgramGroupsQuantities,
        hoursToSendNotification,
        isNoteTimeSelecting,
        noteTimeSelectingText,
        slotSelectionMode,
        slotName,
        isBookingAllowed,
        isCertificateSellingAllowed,
        isBookingSellingAllowed,
        brandServiceProgramExactDuration,
        minProgramResourcesQuantities,
        maxProgramResourcesQuantities,
        announce,
        isShowTimeRange,
        isCommonTime,
        brandServicePhotos,
        brandServiceVideos,
      ];

  const BrandServiceDetailProgramme({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.individualType,
    required this.regularType,
    required this.isLimitResourceNumber,
    required this.hoursToSendNotification,
    required this.isNoteTimeSelecting,
    required this.noteTimeSelectingText,
    required this.slotSelectionMode,
    required this.slotName,
    required this.isBookingAllowed,
    required this.isCertificateSellingAllowed,
    required this.isBookingSellingAllowed,
    required this.brandServiceProgramExactDuration,
    required this.isShowTimeRange,
    required this.isCommonTime,
    required this.brandServicePhotos,
    this.minProgramResourcesQuantities,
    this.maxProgramResourcesQuantities,
    this.brandServiceVideos,
    this.maxProgramGroupsQuantities,
    this.announce,
  });

  @override
  BrandServiceDetailProgramme copyWith() {
    return BrandServiceDetailProgramme(
      id: id,
      code: code,
      name: name,
      description: description,
      individualType: individualType,
      regularType: regularType,
      isLimitResourceNumber: isLimitResourceNumber,
      hoursToSendNotification: hoursToSendNotification,
      isNoteTimeSelecting: isNoteTimeSelecting,
      noteTimeSelectingText: noteTimeSelectingText,
      slotSelectionMode: slotSelectionMode,
      slotName: slotName,
      isBookingAllowed: isBookingAllowed,
      isCertificateSellingAllowed: isCertificateSellingAllowed,
      isBookingSellingAllowed: isBookingSellingAllowed,
      brandServiceProgramExactDuration: brandServiceProgramExactDuration,
      isShowTimeRange: isShowTimeRange,
      isCommonTime: isCommonTime,
      brandServicePhotos: brandServicePhotos,
      minProgramResourcesQuantities: minProgramResourcesQuantities,
      maxProgramResourcesQuantities: maxProgramResourcesQuantities,
      brandServiceVideos: brandServiceVideos,
      maxProgramGroupsQuantities: maxProgramGroupsQuantities,
      announce: announce,
    );
  }
}
