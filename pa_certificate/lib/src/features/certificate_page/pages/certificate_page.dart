import 'package:common/common_theme_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate/src/features/certificate_page/cubit/certificate_cubit.dart';
import 'package:pa_certificate/src/features/certificate_page/widgets/certificate_body.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<CertificateCubit>(
      child: BlocBuilder<CertificateCubit, CertificateState>(
        builder: (context, state) {
          return BasePage(
            
            backgroundColor: context.theme.sixFoldColor,
            body: CertificateBody(
              statusesWithButton: state.statusesWithButton,
              statusesWithBorder: state.statusesWithBorder,
              currentCertificateStatus: state.currentCertificateStatus,
            ),
          );
        },
      ),
    );
  }
}
