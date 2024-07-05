import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/add_block_page/cubit/add_block_cubit.dart';
import 'package:pa_partner/src/features/add_block_page/widgets/add_block_body.dart';

class AddBlockPage extends StatelessWidget {
  const AddBlockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<AddBlockCubit>(
      child: BlocBuilder<AddBlockCubit, AddBlockState>(
        builder: (context, state) {
          final cubit = CubitScope.of<AddBlockCubit>(context);

          return BasePage(
            appBar: CustomAppBar(
              // TODO(dev): локализация
              title: 'Добавить исключение',
              svgAssetPath: CommonAssets.arrowLeftIcon,
              onTap: () {},
            ),
            body: AddBlockBody(
              cubit: cubit,
              selectedBrands: state.selectedBrands,
              brandsGroup: state.brandsGroup,
            ),
          );
        },
      ),
    );
  }
}
