import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_admin/src/common/di/injector.dart';
import 'package:pa_admin/src/features/app/cubit/app_cubit.dart';
import 'package:pa_admin/src/features/sign_in_page/cubit/sign_in_cubit.dart';

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
    ..registerFactory<SignInCubit>(SignInCubit.new);
}
