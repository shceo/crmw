import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CardWithCheckbox extends StatelessWidget {
  final bool value;

  final ValueChanged<bool?> onChanged;

  final String label;

  const CardWithCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CommonDimensions.large),
        border: Border.all(
          color: context.theme.quaternaryColor,
        ),
      ),
      child: Row(
        children: [
          CustomCheckbox(
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(
            width: CommonDimensions.medium,
          ),
          Expanded(
            child: Text(
              label,
            ),
          ),
        ],
      ),
    );
  }
}
