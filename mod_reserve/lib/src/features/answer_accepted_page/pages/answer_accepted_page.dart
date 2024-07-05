import 'package:common/common_bodies_export.dart';
import 'package:common/common_localization_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/answer_accepted_page/cubit/answer_accepted_cubit.dart';

class AnswerAcceptedPage extends StatelessWidget {
  const AnswerAcceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<AnswerAcceptedCubit>(
      child: BlocBuilder<AnswerAcceptedCubit, AnswerAcceptedState>(
        builder: (context, state) {
          return BasePage(
            body: MessageScreenBody(
              title: context.locale.applicationSent,
              subtitle: context.locale.weWillAnswerAsSoonAsPossible,
              actionTitle: context.locale.close,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
