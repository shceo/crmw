import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_salesman/src/feature/sign_in_page/cubit/sign_in_cubit.dart';

class SignInBody extends StatelessWidget {
  final SignInCubit signInCubit;
  const SignInBody({
    required this.signInCubit,
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
