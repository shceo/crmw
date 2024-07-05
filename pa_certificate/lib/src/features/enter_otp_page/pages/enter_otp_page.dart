import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate/src/features/enter_otp_page/cubit/enter_otp_cubit.dart';
import 'package:pa_certificate/src/features/enter_otp_page/widgets/enter_otp_body.dart';

class EnterOtpPage extends StatelessWidget {
  const EnterOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<EnterOtpCubit>(
      child: BlocBuilder<EnterOtpCubit, EnterOtpState>(
        builder: (context, state) {
          return const BasePage(
            body: EnterOtpBody(),
          );
        },
      ),
    );
  }
}
