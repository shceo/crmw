import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_customer/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_customer/src/features/reserve_page/cubit/reserve_cubit.dart';
import 'package:pa_customer/src/features/reserve_page/widgets/reserve_body.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReserveCubit>(
      child: BlocBuilder<ReserveCubit, ReserveState>(
        builder: (context, state) {
          final cubit = CubitScope.of<ReserveCubit>(context);

          return BasePage(
            body: ReserveBody(
              reserveCubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
