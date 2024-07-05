import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class ContactSupportBody extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController commentController;
  final VoidCallback onTap;
  const ContactSupportBody({
    required this.phoneNumberController,
    required this.commentController,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        Text(
          context.locale.contactSupport,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.medium),
        Text(
          context.locale.leavePhoneNumberForSupport,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        InputField(
          controller: phoneNumberController,
          hintText: context.locale.phoneNumber,
        ),
        const SizedBox(height: CommonDimensions.large),
        InputField(
          controller: commentController,
          minLines: CommonDimensions.minSupportLines,
          maxLines: CommonDimensions.maxSupportLines,
          hintText: context.locale.leaveComment,
        ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          text: context.locale.sendReply,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
