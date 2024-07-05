import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/blocks_page/cubit/blocks_cubit.dart';
import 'package:pa_partner/src/features/blocks_page/widgets/blocks_body.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<BlocksCubit>(
      child: BlocBuilder<BlocksCubit, BlocksState>(
        builder: (context, state) {
          final cubit = CubitScope.of<BlocksCubit>(context);

          if (state.blocks.isEmpty) {
            return const _StateLoader();
          }

          return BasePage(
            appBar: CustomAppBar(
              // TODO(dev): локализация

              title: 'Временные блокировки',
              svgAssetPath: CommonAssets.arrowLeftIcon,
              onTap: () {},
            ),
            body: BlocksBody(
              cubit: cubit,
              blocks: state.blocks,
            ),
          );
        },
      ),
    );
  }
}

class _StateLoader extends StatelessWidget {
  const _StateLoader();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
