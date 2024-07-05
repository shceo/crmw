import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class EditContactBody extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final bool value;
  final ValueChanged<bool?> valueChanged;
  final VoidCallback onSendNotificationTap;
  
  const EditContactBody({
    required this.phoneNumberController,
    required this.value,
    required this.valueChanged,
    required this.onSendNotificationTap,
    super.key,
  });

  @override
  State<EditContactBody> createState() => _EditContactBodyState();
}

class _EditContactBodyState extends State<EditContactBody> {
  bool isCheckboxActive = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        const SizedBox(height: CommonDimensions.medium),
        Text(
          context.locale.repeatedNotification,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        Text(
          context.locale.enterPhoneNumberWithMessenger,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        InputField(
          controller: widget.phoneNumberController,
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: context.theme.textFieldColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.textFieldColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.textFieldColor,
              ),
            ),
            hintText: context.locale.enterPhoneNumber,
            hintStyle: context.themeData.textTheme.titleLarge?.copyWith(
              color: context.theme.secondaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: CommonDimensions.medium),
        Row(
          children: [
            CustomCheckbox(
              value: widget.value,
              onChanged: widget.valueChanged,
            ),
            const SizedBox(width: CommonDimensions.medium),
            Text(
              context.locale.dontHaveMessengerSendMessage,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.secondaryTextColor,
                fontSize: CommonFonts.sizeTitleMedium,
                fontWeight: CommonFonts.regular,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        CustomButton.text(
          text: context.locale.sendRepeatedNotification,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: widget.onSendNotificationTap,
        ),
      ],
    );
  }
}
