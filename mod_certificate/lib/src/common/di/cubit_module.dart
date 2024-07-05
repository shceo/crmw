import 'package:common/common_shared_cubit_export.dart';
import 'package:mod_certificate/src/common/di/injector.dart';
import 'package:mod_certificate/src/features/app/cubit/app_cubit.dart';
import 'package:mod_certificate/src/features/search_event_page/cubit/search_event_cubit.dart';

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
      SearchEventCubit.new,
    );
}
