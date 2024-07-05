import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/add_shutdown_page/cubit/add_shutdown_cubit.dart';
import 'package:pa_partner/src/features/add_shutdown_page/widgets/add_shutdown_body.dart';

class AddShutdownPage extends StatelessWidget {
  const AddShutdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<AddShutdownCubit>(
      child: BlocBuilder<AddShutdownCubit, AddShutdownState>(
        builder: (context, state) {
          final cubit = CubitScope.of<AddShutdownCubit>(context);
          return BasePage(
            appBar: CustomAppBar(
              // TODO(dev): локализация
              title: 'Временное отключение',
              svgAssetPath: CommonAssets.arrowLeftIcon,
              onTap: () {},
            ),
            body: AddShutdownBody(
              cubit: cubit,
              selectedServices: state.selectedServices,
              servicesGroup: state.servicesGroup,
              programs: state.programs,
            ),
          );
        },
      ),
    );
  }
}
