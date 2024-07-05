// ignore_for_file: lines_longer_than_80_chars

import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class InputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  final String? Function(String?)? validator;

  final String? hintText;

  // By default , value of {onChanged} is [null]
  final ValueChanged<String>? onChanged;

  // By default , value of {controller} is [null]
  final TextEditingController? controller;

  // By default, value of {fieldTitle} is [null]
  final String? fieldTitle;

  final VoidCallback? onTap;

  /// By default, the value of {focusNode} is [FocusNode]
  final FocusNode? focusNode;

  final bool? readOnly;

  /// By default, the value of {textCapitalization} is [TextCapitalization.sentences]
  final TextCapitalization textCapitalization;

  final InputDecoration? inputDecoration;

  final TextInputType? keyboardType;

  final String? initialValue;

  final List<TextInputFormatter>? formatters;

  // Icon that takes place on the right side of the text field
  final Widget? suffixIcon;

  // Icon that takes place on the left side of the text field
  final Widget? prefixIcon;

  final bool enableInteractiveSelection;

  /// By default, the value of {minLines} is [1]
  final int minLines;

  /// By default, the value of {minLines} is [2]
  final int maxLines;

  final bool? enabled;

  const InputField({
    this.hintText,
    this.keyboardType,
    this.formKey,
    this.validator,
    this.onChanged,
    this.controller,
    this.inputDecoration,
    this.onTap,
    this.readOnly,
    this.fieldTitle,
    this.formatters,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.initialValue,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.enableInteractiveSelection = true,
    this.minLines = CommonDimensions.minLines,
    this.maxLines = CommonDimensions.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formKey,
          child: TextFormField(
            enableInteractiveSelection: enableInteractiveSelection,
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: initialValue,
            onTap: onTap,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            inputFormatters: formatters,
            textCapitalization: textCapitalization,
            style: themePath.headlineMedium?.copyWith(
              color: colorPath.primaryTextColor,
              fontWeight: CommonFonts.regular,
            ),
            enabled: enabled,
            controller: controller,
            validator: validator,
            cursorColor: colorPath.mainColor,
            focusNode: focusNode,
            minLines: minLines,
            maxLines: maxLines,
            decoration: inputDecoration ??
                InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: CommonDimensions.medium,
                    horizontal: CommonDimensions.large,
                  ),
                  filled: true,
                  fillColor: colorPath.textFieldColor,
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        CommonDimensions.large,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: colorPath.quaternaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        CommonDimensions.large,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: colorPath.quaternaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPath.errorColor),
                  ),
                  hintText: hintText,
                  hintStyle: themePath.titleLarge?.copyWith(
                    color: context.theme.secondaryTextColor,
                  ),
                ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
