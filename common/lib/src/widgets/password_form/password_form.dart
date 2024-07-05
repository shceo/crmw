import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CreatePasswordForm extends StatelessWidget {
  const CreatePasswordForm({
    required this.title,
    required this.subtitle,
    required this.onLoginTap,
    required this.onExitTap,
    required this.newPasswordController,
    required this.repeatPasswordController,
    super.key,
  });
  final String title;
  final String subtitle;
  final VoidCallback onLoginTap;
  final VoidCallback onExitTap;
  final TextEditingController newPasswordController;
  final TextEditingController repeatPasswordController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        /// Button Back
        Row(
          children: [
            CustomVectorButton(
              assetPath: CommonAssets.backIcon,
              onPressed: onExitTap,
            ),
          ],
        ),

        /// Text Title
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
        const SizedBox(height: CommonDimensions.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subtitle,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: CommonFonts.regular,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.extraLarge),

        /// InputField for password
        InputField(
          hintText: context.locale.newPassword,
          controller: newPasswordController,
        ),
        const SizedBox(height: CommonDimensions.large),

        /// InputField for confirm password
        InputField(
          hintText: context.locale.repeatPassword,
          controller: repeatPasswordController,
        ),
        const SizedBox(height: CommonDimensions.superLarge),

        /// Button Confirm
        CustomButton.text(
          onTap: onLoginTap,
          text: context.locale.confirm,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
      ],
    );
  }
}
