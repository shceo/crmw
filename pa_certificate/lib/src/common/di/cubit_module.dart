import 'package:common/common_shared_cubit_export.dart';
import 'package:pa_certificate/src/common/di/injector.dart';
import 'package:pa_certificate/src/features/app/cubit/app_cubit.dart';
import 'package:pa_certificate/src/features/certificate_page/cubit/certificate_cubit.dart';
import 'package:pa_certificate/src/features/enter_otp_page/cubit/enter_otp_cubit.dart';
import 'package:pa_certificate/src/features/gift_certificate_page/cubit/gift_certificate_cubit.dart';
import 'package:pa_certificate/src/features/sign_in_page/cubit/sign_in_cubit.dart';

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
    ..registerFactory<SignInCubit>(SignInCubit.new)
    ..registerFactory<CertificateCubit>(CertificateCubit.new)
    ..registerFactory<EnterOtpCubit>(EnterOtpCubit.new)
    ..registerFactory<GiftCertificateCubit>(GiftCertificateCubit.new);
}
