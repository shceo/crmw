import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate/src/features/gift_certificate_page/cubit/gift_certificate_cubit.dart';
import 'package:pa_certificate/src/features/gift_certificate_page/widgets/gift_certificate_body.dart';

class GiftCertificatePage extends StatelessWidget {
  const GiftCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<GiftCertificateCubit>(
      child: BlocBuilder<GiftCertificateCubit, GiftCertificateState>(
        builder: (context, state) {
          return const BasePage(
            body: GiftCertificateBody(),
          );
        },
      ),
    );
  }
}
