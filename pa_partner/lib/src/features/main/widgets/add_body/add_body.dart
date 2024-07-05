import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/main/cubit/add_cubit/add_cubit.dart';

class AddBody extends StatelessWidget {
  const AddBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<AddCubit>(
      child: BlocBuilder<AddCubit, AddState>(
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(CommonDimensions.commonPadding),
            children: const [
              Text('Add'),
            ],
          );
        },
      ),
    );
  }
}
