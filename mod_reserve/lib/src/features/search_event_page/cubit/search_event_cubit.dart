import 'dart:async';

import 'package:common/common_navigation_export.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:core/domain/interactors/mod_reserve_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mod_reserve/src/common/navigation/app_router.dart';
import 'package:mod_reserve/src/common/navigation/configurations.dart';

part 'search_event_state.dart';

class SearchEventCubit extends Cubit<SearchEventState> {
  final ModReserveInteractor _modReserveInteractor;
  SearchEventCubit(this._modReserveInteractor)
      : super(
          const SearchEventState(
            route: CustomRoute(null, null),
            brandServiceAddress: [],
            brandServiceType: [],
            brandServiceProgramme: [],
            brandServiceDetailProgramme: [],
            categoryId: 0,
            programmeId: 0,
            addressId: 0,
            categoryName: '',
          ),
        ) {
    _subscribeAll();
  }

  GoRouter get _router => AppRouter.appRouter;

  StreamSubscription<List<BrandServiceType>?>? _brandServiceTypeSubscription;

  StreamSubscription<List<BrandServiceAddress>?>?
      _brandServiceAddressSubscription;

  StreamSubscription<List<BrandServiceProgramme>?>?
      _brandServiceProgrammeSubscription;

  void _subscribeAll() {
    getBrandServiceTypes();

    _brandServiceTypeSubscription?.cancel();
    _brandServiceTypeSubscription =
        _modReserveInteractor.brandServiceTypeStream.listen(
      _onNewBrandServiceType,
    );

    _brandServiceAddressSubscription?.cancel();
    _brandServiceAddressSubscription =
        _modReserveInteractor.brandServiceAddressStream.listen(
      _onNewBrandServiceAddress,
    );

    _brandServiceProgrammeSubscription?.cancel();
    _brandServiceProgrammeSubscription =
        _modReserveInteractor.brandServiceProgrammeStream.listen(
      _onNewBrandServiceProgramme,
    );
  }

  // 1.0 METHOD
  Future<void> getBrandServiceTypes() {
    return _modReserveInteractor.getBrandServiceType();
  }

  // 2.0 METHOD
  Future<void> getBrandServiceAddress() {
    return _modReserveInteractor.getBrandServiceAddress(
      categoryId: state.categoryId,
    );
  }

  // 3.0 METHOD
  Future<void> getBrandServiceProgrammeByAddress() {
    return _modReserveInteractor.getBrandServiceProgrammeByAddress(
      categoryId: state.categoryId,
      addressId: state.addressId,
    );
  }

  void updateCategoryId({required int categoryId}) {
    emit(
      state.copyWith(
        categoryId: categoryId,
      ),
    );
  }

  void updateAddressId({required int addressId}) {
    emit(
      state.copyWith(
        addressId: addressId,
      ),
    );
  }

  void updateCategoryName({required String categoryName}) {
    emit(
      state.copyWith(
        categoryName: categoryName,
      ),
    );
  }

  void _onNewBrandServiceType(List<BrandServiceType>? brandServiceType) {
    emit(
      state.copyWith(
        brandServiceType: brandServiceType,
      ),
    );

    emit(
      state.copyWith(
        categoryId: brandServiceType?.first.id,
        categoryName: brandServiceType?.first.serviceType.name,
      ),
    );

    getBrandServiceAddress();
  }

  void _onNewBrandServiceAddress(
    List<BrandServiceAddress>? brandServiceAddress,
  ) {
    emit(
      state.copyWith(
        brandServiceAddress: brandServiceAddress,
        addressId: brandServiceAddress?.first.id,
      ),
    );

    getBrandServiceProgrammeByAddress();
  }

  void _onNewBrandServiceProgramme(
    List<BrandServiceProgramme>? brandServiceProgramme,
  ) {
    emit(
      state.copyWith(
        brandServiceProgramme: brandServiceProgramme,
      ),
    );
  }

  void navigateToDetailPage({
    required int programmeId,
  }) {
    _router.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        detailEventConfig(
          categoryId: state.categoryId,
          programmeId: programmeId,
          addressId: state.addressId,
          categoryName: state.categoryName,
          pathParameters: {
            'category_id': '${state.categoryId}',
            'programme_id': '$programmeId',
            'address_id': '${state.addressId}',
            'category_name': state.categoryName,
          },
        ),
      ),
    );
  }

  void onBackButtonTap() {
    _router.navigateTo(
      const CustomRoute.pop(),
    );
  }
}
