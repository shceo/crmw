import 'package:common/common_localization_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_admin/src/features/sign_in_page/cubit/sign_in_cubit.dart';

class SignInBody extends StatelessWidget {
  final SignInCubit signInCubit;
  const SignInBody({
    required this.signInCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignInForm(
      title: context.locale.personalAccount,
      subtitle: context.locale.admin,
      onLoginTap: () {},
      loginController: TextEditingController(),
      passwordController: TextEditingController(),
    );
  }
}
