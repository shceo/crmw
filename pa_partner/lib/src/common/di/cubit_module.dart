import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:pa_partner/src/features/add_block_page/cubit/add_block_cubit.dart';
import 'package:pa_partner/src/features/add_shutdown_page/cubit/add_shutdown_cubit.dart';
import 'package:pa_partner/src/features/app/cubit/app_cubit.dart';
import 'package:pa_partner/src/features/blocks_page/cubit/blocks_cubit.dart';
import 'package:pa_partner/src/features/main/cubit/add_cubit/add_cubit.dart';
import 'package:pa_partner/src/features/main/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:pa_partner/src/features/main/cubit/notification_cubit/notification_cubit.dart';
import 'package:pa_partner/src/features/main/cubit/search_cubit/search_cubit.dart';
import 'package:pa_partner/src/features/main/cubit/settings_cubit/settings_cubit.dart';
import 'package:pa_partner/src/features/sign_in_page/cubit/sign_in_cubit.dart';

void initSharedCubits() {
  i
    ..registerLazySingleton<ThemeSharedCubit>(ThemeSharedCubit.new)
    ..registerLazySingleton<AppOverlayCubit>(AppOverlayCubit.new)
    ..registerLazySingleton<NavigationPanelCubit>(NavigationPanelCubit.new);
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
      ),
    )
    ..registerFactory<SearchCubit>(SearchCubit.new)
    ..registerFactory<CalendarCubit>(
      CalendarCubit.new,
    )
    ..registerFactory<AddCubit>(AddCubit.new)
    ..registerFactory<NotificationCubit>(NotificationCubit.new)
    ..registerFactory<SettingsCubit>(SettingsCubit.new)
    ..registerFactory<SignInCubit>(SignInCubit.new)
    ..registerFactory<AddBlockCubit>(AddBlockCubit.new)
    ..registerFactory<AddShutdownCubit>(AddShutdownCubit.new)
    ..registerFactory<BlocksCubit>(BlocksCubit.new);
}
