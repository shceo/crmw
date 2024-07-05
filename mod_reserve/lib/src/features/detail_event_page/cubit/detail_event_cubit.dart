import 'dart:async';

import 'package:common/common_navigation_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:core/data/entities/detail_slot_time.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/time_slot/time_slot.dart';
import 'package:core/domain/entities/time_slot/time_slot_variant.dart';
import 'package:core/domain/interactors/mod_reserve_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mod_reserve/src/common/navigation/app_router.dart';

part 'detail_event_state.dart';

class DetailEventCubit extends Cubit<DetailEventState> {
  final ModReserveInteractor _modReserveInteractor;
  DetailEventCubit(
    this._modReserveInteractor,
  ) : super(
          const DetailEventState(
            route: CustomRoute(null, null),
            brandServiceDetailProgramme: [],
            brandServiceDenomination: [],
            currentProgramDuration: null,
            brandServiceDate: [],
            brandServiceTimeSlot: [],
            selectedDate: '',
            timeSlotVariant: [],
            detailSlotTime: [],
            categoryId: 0,
            programmeId: 0,
            addressId: 0,
          ),
        ) {
    _subscribeAll();
  }

  GoRouter get _router => AppRouter.appRouter;

  StreamSubscription<List<BrandServiceDetailProgramme>?>?
      _brandServiceDetailProgrammeSubscription;

  StreamSubscription<List<BrandServiceDenomination>?>?
      _brandServiceDenominationSubscription;

  StreamSubscription<List<BrandServiceDate>?>? _brandServiceDateSubscription;

  StreamSubscription<List<BrandServiceTimeSlot>?>?
      _brandServiceTimeSlotSubscription;

  void _subscribeAll() {
    _brandServiceDetailProgrammeSubscription?.cancel();
    _brandServiceDetailProgrammeSubscription =
        _modReserveInteractor.brandServiceDetailProgrammeStream.listen(
      _onNewBrandServiceDetailProgramme,
    );

    _brandServiceDenominationSubscription?.cancel();
    _brandServiceDenominationSubscription =
        _modReserveInteractor.brandServiceDenominationStream.listen(
      _onNewBrandServiceDenomination,
    );

    _brandServiceDateSubscription?.cancel();
    _brandServiceDateSubscription =
        _modReserveInteractor.brandServiceDateStream.listen(
      _onNewBrandServiceDate,
    );

    _brandServiceTimeSlotSubscription?.cancel();
    _brandServiceTimeSlotSubscription =
        _modReserveInteractor.brandServiceTimeSlotStream.listen(
      _onNewBrandServiceTimeSlot,
    );
  }

  // GET METHODS
  Future<void> getBrandServiceDetailProgramme({
    required int categoryId,
    required int programmeId,
  }) {
    return _modReserveInteractor.getBrandServiceDetailProgramme(
      categoryId: categoryId,
      programmeId: programmeId,
    );
  }

  Future<void> getBrandServiceDenomination({
    required int programmeExactItemId,
  }) {
    return _modReserveInteractor.getBrandServiceDenomination(
      programmeExactItemId: programmeExactItemId,
    );
  }

  Future<void> getBrandServiceDate({
    required int programmeId,
    required int addressId,
  }) {
    return _modReserveInteractor.getBrandServiceDate(
      programmeId: programmeId,
      addressId: addressId,
    );
  }

  Future<void> getTimeSlot() {
    return _modReserveInteractor.getTimeSlot(
      programmeExactItemId: state.currentProgramDuration!.id,
      timeSlot: TimeSlot(
        address: '${state.addressId}',
        date: state.selectedDate,
        variants: state.timeSlotVariant ?? [],
      ),
    );
  }
  // GET METHODS

  // UPDATE METHODS

  void updatePageParameters({
    required int categoryId,
    required int programmeId,
    required int addressId,
  }) {
    emit(
      state.copyWith(
        categoryId: categoryId,
        programmeId: programmeId,
        addressId: addressId,
      ),
    );
  }

  void updateTimeSlotVariant(Map<String, int> map) {
    final id = map['id'];
    final count = map['count'];

    final existingSlotIndex =
        state.timeSlotVariant?.indexWhere((slot) => slot.id == id);

    if (existingSlotIndex != -1) {
      final updatedList = List<TimeSlotVariant>.from(
        state.timeSlotVariant!,
      );
      updatedList[existingSlotIndex!] = TimeSlotVariant(id: id!, count: count!);
      emit(state.copyWith(timeSlotVariant: updatedList));
    } else {
      final slot = TimeSlotVariant(id: id!, count: count!);
      final updatedList = List<TimeSlotVariant>.from(
        state.timeSlotVariant!,
      )..add(slot);
      emit(state.copyWith(timeSlotVariant: updatedList));
    }

    getTimeSlot();
  }

  void updateCurrentProgramDuration(
    BrandServiceProgramExactDuration currentProgramDuration,
  ) {
    emit(
      state.copyWith(
        currentProgramDuration: currentProgramDuration,
      ),
    );
    getTimeSlot();
  }

  void updateSelectedDate(String selectedDate) {
    emit(
      state.copyWith(
        selectedDate: selectedDate,
      ),
    );

    getTimeSlot();
  }
  // UPDATE METHODS

  // LISTEN METHODS
  void _onNewBrandServiceDetailProgramme(
    List<BrandServiceDetailProgramme>? brandServiceDetailProgramme,
  ) {
    emit(
      state.copyWith(
        brandServiceDetailProgramme: brandServiceDetailProgramme,
      ),
    );

    // ignore: lines_longer_than_80_chars
    final firstProgramDuration = brandServiceDetailProgramme!
        .first.brandServiceProgramExactDuration.first;

    emit(
      state.copyWith(
        currentProgramDuration: firstProgramDuration,
      ),
    );

    getBrandServiceDenomination(
      programmeExactItemId: state.currentProgramDuration!.id,
    );
  }

  void _onNewBrandServiceDenomination(
    List<BrandServiceDenomination>? brandServiceDenomination,
  ) {
    emit(
      state.copyWith(
        brandServiceDenomination: brandServiceDenomination,
      ),
    );
  }

  void _onNewBrandServiceDate(
    List<BrandServiceDate>? brandServiceDate,
  ) {
    emit(
      state.copyWith(
        brandServiceDate: brandServiceDate,
        selectedDate: brandServiceDate?.first.date,
      ),
    );
  }

  void _onNewBrandServiceTimeSlot(
    List<BrandServiceTimeSlot>? brandServiceTimeSlot,
  ) {
    var totalValue = 0;
    var symbol = '';
    emit(
      state.copyWith(
        brandServiceTimeSlot: brandServiceTimeSlot,
      ),
    );

    for (final timeSlot in brandServiceTimeSlot!) {
      for (final slot in timeSlot.variants) {
        if (slot.price?.value != null) {
          totalValue += slot.price!.value;
        }
        if (slot.price?.currency.symbol != null) {
          symbol = slot.price!.currency.symbol;
        }
        emit(
          state.copyWith(
            detailSlotTime: [
              ...state.detailSlotTime,
              DetailSlotTime(
                dateTimeStart: timeSlot.datetimeStart.toHHmm(),
                dateTimeEnd: timeSlot.datetimeEnd.toHHmm(),
                value: '$totalValue',
                symbol: symbol,
                status: TimeSlotStatus.available,
              ),
            ],
          ),
        );
      }
    }
  }
  // LISTEN METHODS

  void onBackButtonTap() {
    _router.navigateTo(
      const CustomRoute.pop(),
    );
  }
}
