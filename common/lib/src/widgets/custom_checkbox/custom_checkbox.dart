import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final BorderSide? side;
  final OutlinedBorder? shape;
  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.side,
    this.shape,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: activeColor ?? context.theme.mainColor,
      side: side ??
          BorderSide(
            color: context.theme.quaternaryColor,
            width: CommonDimensions.checkBoxBorderWidth,
          ),
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                CommonDimensions.small,
              ),
            ),
          ),
      value: value,
      onChanged: onChanged,
    );
  }
}
