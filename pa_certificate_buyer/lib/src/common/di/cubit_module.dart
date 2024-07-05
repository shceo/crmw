import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_certificate_buyer/src/common/di/injector.dart';
import 'package:pa_certificate_buyer/src/feature/app/cubit/app_cubit.dart';
import 'package:pa_certificate_buyer/src/feature/certificate_buyer_page/cubit/certificate_buyer_cubit.dart';

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
    ..registerFactory<CertificateBuyerCubit>(CertificateBuyerCubit.new);
}
