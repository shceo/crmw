import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_customer/src/common/di/injector.dart';
import 'package:pa_customer/src/features/app/cubit/app_cubit.dart';
import 'package:pa_customer/src/features/reserve_page/cubit/reserve_cubit.dart';

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
    ..registerFactory<ReserveCubit>(ReserveCubit.new);
}
