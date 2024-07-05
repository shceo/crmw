import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_salesman/src/common/di/injector.dart';
import 'package:pa_salesman/src/feature/app/cubit/app_cubit.dart';
import 'package:pa_salesman/src/feature/sign_in_page/cubit/sign_in_cubit.dart';

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
