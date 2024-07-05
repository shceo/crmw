import 'package:bloc/bloc.dart';
import 'package:common/common_navigation_export.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pa_partner/src/common/navigation/app_router.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  

  CalendarCubit()
      : super(
          const CalendarState(
            brandServiceAddress: [],
          ),
        );

  final GoRouter _router = AppRouter.appRouter;

  void updateAddressId({required int addressId}) {}

  void navigateToYourPage() {
    _router.navigateTo(
      const CustomRoute(RouteType.navigateTo, null),
    );
  }
}
