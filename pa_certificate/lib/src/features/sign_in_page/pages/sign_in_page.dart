import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate/src/features/sign_in_page/cubit/sign_in_cubit.dart';
import 'package:pa_certificate/src/features/sign_in_page/widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SignInCubit>(
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit = CubitScope.of<SignInCubit>(context);

          return BasePage(
            body: SignInBody(
              signInCubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
