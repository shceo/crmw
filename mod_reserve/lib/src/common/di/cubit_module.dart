import 'package:common/common_shared_cubit_export.dart';
import 'package:mod_reserve/src/common/di/injector.dart';
import 'package:mod_reserve/src/features/answer_accepted_page/cubit/answer_accepted_cubit.dart';
import 'package:mod_reserve/src/features/app/cubit/app_cubit.dart';
import 'package:mod_reserve/src/features/basket_page/cubit/basket_cubit.dart';
import 'package:mod_reserve/src/features/check_reserve_notification_page/cubit/check_reserve_notification_cubit.dart';
import 'package:mod_reserve/src/features/confirm_reserve_page/cubit/confirm_reserve_cubit.dart';
import 'package:mod_reserve/src/features/contact_support_page/cubit/contact_support_cubit.dart';
import 'package:mod_reserve/src/features/detail_event_page/cubit/detail_event_cubit.dart';
import 'package:mod_reserve/src/features/edit_contact_page/cubit/edit_contact_cubit.dart';
import 'package:mod_reserve/src/features/enter_contact_page/cubit/enter_contact_cubit.dart';
import 'package:mod_reserve/src/features/search_event_page/cubit/search_event_cubit.dart';
import 'package:mod_reserve/src/features/thanksgiving_page/cubit/thanksgiving_cubit.dart';

void initSharedCubits() {
  i
    ..registerLazySingleton<ThemeSharedCubit>(ThemeSharedCubit.new)
    ..registerLazySingleton<AppOverlayCubit>(AppOverlayCubit.new);
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
      ),
    )
    ..registerFactory<SearchEventCubit>(
      () => SearchEventCubit(
        i.get(),
      ),
    )
    ..registerFactory(ConfirmReserveCubit.new)
    ..registerFactory(EditContactCubit.new)
    ..registerFactory(CheckReserveNotificationCubit.new)
    ..registerFactory(ContactSupportCubit.new)
    ..registerFactory(AnswerAcceptedCubit.new)
    ..registerFactory(ThanksgivingCubit.new)
    ..registerFactory(EnterContactCubit.new)
    ..registerFactory(BasketCubit.new)
    ..registerFactory<DetailEventCubit>(
      () => DetailEventCubit(
        i.get(),
      ),
    );
}
