import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate_buyer/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate_buyer/src/feature/certificate_buyer_page/cubit/certificate_buyer_cubit.dart';
import 'package:pa_certificate_buyer/src/feature/certificate_buyer_page/widgets/certificate_buyer_body.dart';

class CertificateBuyerPage extends StatelessWidget {
  const CertificateBuyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<CertificateBuyerCubit>(
      child: BlocBuilder<CertificateBuyerCubit, CertificateBuyerState>(
        builder: (context, state) {
          // final cubit = CubitScope.of<CertificateBuyerCubit>(context);

          return const BasePage(
            body: CertificateBuyerBody(),
          );
        },
      ),
    );
  }
}
