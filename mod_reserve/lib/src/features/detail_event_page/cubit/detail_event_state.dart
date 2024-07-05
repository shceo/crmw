part of 'detail_event_cubit.dart';

final class DetailEventState extends Equatable {
  final CustomRoute route;
  final List<BrandServiceDetailProgramme>? brandServiceDetailProgramme;
  final List<BrandServiceDenomination>? brandServiceDenomination;
  final BrandServiceProgramExactDuration? currentProgramDuration;
  final List<BrandServiceDate>? brandServiceDate;
  final List<BrandServiceTimeSlot> brandServiceTimeSlot;
  final List<TimeSlotVariant>? timeSlotVariant;
  final List<DetailSlotTime> detailSlotTime;
  final String selectedDate;
  final int categoryId;
  final int programmeId;
  final int addressId;
  @override
  List<Object?> get props => [
        route,
        brandServiceDetailProgramme,
        brandServiceDenomination,
        currentProgramDuration,
        brandServiceDate,
        brandServiceTimeSlot,
        detailSlotTime,
        selectedDate,
        timeSlotVariant,
        categoryId,
        programmeId,
        addressId,
      ];

  const DetailEventState({
    required this.route,
    required this.brandServiceDetailProgramme,
    required this.brandServiceDenomination,
    required this.currentProgramDuration,
    required this.brandServiceDate,
    required this.brandServiceTimeSlot,
    required this.detailSlotTime,
    required this.selectedDate,
    required this.timeSlotVariant,
    required this.categoryId,
    required this.programmeId,
    required this.addressId,
  });

  DetailEventState copyWith({
    CustomRoute? route,
    List<BrandServiceDetailProgramme>? brandServiceDetailProgramme,
    List<BrandServiceDenomination>? brandServiceDenomination,
    BrandServiceProgramExactDuration? currentProgramDuration,
    List<BrandServiceDate>? brandServiceDate,
    List<BrandServiceTimeSlot>? brandServiceTimeSlot,
    String? selectedDate,
    List<TimeSlotVariant>? timeSlotVariant,
    List<DetailSlotTime>? detailSlotTime,
    int? categoryId,
    int? programmeId,
    int? addressId,
  }) {
    return DetailEventState(
      route: route ?? this.route,
      brandServiceDetailProgramme:
          brandServiceDetailProgramme ?? this.brandServiceDetailProgramme,
      brandServiceDenomination:
          brandServiceDenomination ?? this.brandServiceDenomination,
      currentProgramDuration:
          currentProgramDuration ?? this.currentProgramDuration,
      brandServiceDate: brandServiceDate ?? this.brandServiceDate,
      brandServiceTimeSlot: brandServiceTimeSlot ?? this.brandServiceTimeSlot,
      selectedDate: selectedDate ?? this.selectedDate,
      timeSlotVariant: timeSlotVariant ?? this.timeSlotVariant,
      detailSlotTime: detailSlotTime ?? this.detailSlotTime,
      categoryId: categoryId ?? this.categoryId,
      programmeId: programmeId ?? this.programmeId,
      addressId: addressId ?? this.addressId,
    );
  }
}
