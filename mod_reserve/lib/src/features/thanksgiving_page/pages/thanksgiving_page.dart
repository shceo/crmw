import 'package:common/common_bodies_export.dart';
import 'package:common/common_localization_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/thanksgiving_page/cubit/thanksgiving_cubit.dart';

class ThanksgivingPage extends StatelessWidget {
  const ThanksgivingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ThanksgivingCubit>(
      child: BlocBuilder<ThanksgivingCubit, ThanksgivingState>(
        builder: (context, state) {
          return BasePage(
            body: MessageScreenBody(
              title: context.locale.thanksForAnswer,
              actionTitle: context.locale.close,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
