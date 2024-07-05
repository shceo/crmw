import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/check_reserve_notification_page/cubit/check_reserve_notification_cubit.dart';

class CheckReserveNotificationPage extends StatelessWidget {
  const CheckReserveNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<CheckReserveNotificationCubit>(
      child: BlocBuilder<CheckReserveNotificationCubit,
          CheckReserveNotificationState>(
        builder: (context, state) {
          return BasePage(
            body: CheckReserveNotificationBody(
              onNotificationArrivedTap: () {},
              onNotificationDidntArrivedTap: () {},
            ),
          );
        },
      ),
    );
  }
}
