import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/common/utils/mocks/reserve_order_mock.dart';
import 'package:mod_reserve/src/features/confirm_reserve_page/cubit/confirm_reserve_cubit.dart';

class ConfirmReservePage extends StatelessWidget {
  const ConfirmReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ConfirmReserveCubit>(
      child: BlocBuilder<ConfirmReserveCubit, ConfirmReserveState>(
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<ConfirmReserveCubit>(context);
          return BasePage(
            body: ConfirmReserveBody(
              confirmationNumber: ReserveOrderMock.data.confirmationNumber,
              clientNumber: ReserveOrderMock.data.clientNumber,
              supportEmail: ReserveOrderMock.data.supportEmail,
              onWhatsappTap: () {},
              onTelegramTap: () {},
              onVkTap: () {},
              onReceivedMessageTap: () {},
              onEditNumberTap: () {},
              onReservePageReturnTap: () {},
            ),
          );
        },
      ),
    );
  }
}
