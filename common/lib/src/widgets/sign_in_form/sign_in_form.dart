import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    required this.title,
    required this.subtitle,
    required this.onLoginTap,
    required this.loginController,
    required this.passwordController,
    super.key,
  });
  final String title;
  final String subtitle;
  final VoidCallback onLoginTap;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        // Text Title
        const SizedBox(height: CommonDimensions.superLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.themeData.textTheme.displayLarge?.copyWith(
                fontWeight: CommonFonts.semiBold,
              ),
            ),
          ],
        ),

        /// Text Subtitle
        const SizedBox(height: CommonDimensions.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subtitle,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: CommonFonts.medium,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.extraLarge),

        /// InputField for login
        InputField(
          hintText: context.locale.enterLogin,
          controller: loginController,
        ),
        const SizedBox(height: CommonDimensions.large),

        /// InputField for password
        InputField(
          hintText: context.locale.enterPassword,
          suffixIcon: const CustomVectorImage(
            svgAssetPath: CommonAssets.visibilityIcon,
          ),
          controller: passwordController,
        ),
        const SizedBox(height: CommonDimensions.medium),

        /// Hint forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              context.locale.forgotPassword,
              style: context.themeData.textTheme.labelLarge?.copyWith(
                color: context.theme.secondaryTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.superLarge),

        /// Button Login
        CustomButton.text(
          onTap: onLoginTap,
          text: context.locale.login,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
      ],
    );
  }
}
