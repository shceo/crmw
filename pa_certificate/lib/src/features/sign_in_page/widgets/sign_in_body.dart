import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pa_certificate/src/features/sign_in_page/cubit/sign_in_cubit.dart';

class SignInBody extends StatelessWidget {
  final SignInCubit signInCubit;
  const SignInBody({
    required this.signInCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        const SizedBox(height: CommonDimensions.superLarge),
        Text(
          'Вход в личный кабинет',
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.mediumLarge),
        Text(
          'Введите номер телефона, на него придёт смс код',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        InputField(
          hintText: context.locale.phoneNumber,
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        CustomButton.text(
          text: 'Прислать код',
          onTap: () {},
        ),
        const SizedBox(
          height: CommonDimensions.multiLarge,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Есть вопросы? ',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: CommonFonts.regular,
                  ),
                ),
                TextSpan(
                  text: 'Связаться с тех.поддержкой',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.tertiaryTextColor,
                    fontWeight: CommonFonts.semiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
