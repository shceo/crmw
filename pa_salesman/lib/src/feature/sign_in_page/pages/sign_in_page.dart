import 'package:common/common_localization_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_salesman/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_salesman/src/feature/sign_in_page/cubit/sign_in_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SignInCubit>(
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          // final cubit = CubitScope.of<SignInCubit>(context);

          return SignInForm(
            title: context.locale.personalAccount,
            subtitle: context.locale.productManager,
            onLoginTap: () {},
            loginController: TextEditingController(),
            passwordController: TextEditingController(),
          );
        },
      ),
    );
  }
}
