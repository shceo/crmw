import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_customer/src/features/reserve_page/cubit/reserve_cubit.dart';

class ReserveBody extends StatelessWidget {
  final ReserveCubit reserveCubit;
  const ReserveBody({
    required this.reserveCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(CommonDimensions.large),
      // Delete this ignore after adding widget in children
      // ignore: prefer_const_literals_to_create_immutables
      children: [],
    );
  }
}
