import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:pa_partner/src/features/sign_in_page/cubit/sign_in_cubit.dart';
import 'package:pa_partner/src/features/sign_in_page/widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SignInCubit>(
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit = CubitScope.of<SignInCubit>(context);

          // return BasePage(
          //   appBar: CustomAppBar(
          //     title: 'SignIn',
          //   ),
          //   body: SignInBody(
          //     signInCubit: cubit,
          //   ),
          // );

          return BaseNavigationPage(
            body: SignInBody(
              signInCubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
