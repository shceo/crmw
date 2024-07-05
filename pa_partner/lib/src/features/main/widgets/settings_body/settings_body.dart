import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/main/cubit/settings_cubit/settings_cubit.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SettingsCubit>(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(CommonDimensions.commonPadding),
            children: const [
              Text('Settings'),
            ],
          );
        },
      ),
    );
  }
}
