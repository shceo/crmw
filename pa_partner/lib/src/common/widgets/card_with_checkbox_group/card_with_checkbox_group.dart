import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_partner/src/common/widgets/card_with_checkbox/card_with_checkbox.dart';

class CardWithCheckboxGroup extends StatelessWidget {
  final String title;
  final List<String> items;
  final List selected;
  final Function({required String label, bool? value}) onChanged;

  const CardWithCheckboxGroup({
    required this.title,
    required this.items,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: CommonDimensions.extraLarge,
        ),
        Text(
          title,
        ),
        for (final item in items)
          Column(
            children: [
              const SizedBox(
                height: CommonDimensions.mediumLarge,
              ),
              CardWithCheckbox(
                label: item,
                value: selected.contains(item),
                onChanged: (value) => onChanged(label: item, value: value),
              ),
            ],
          ),
      ],
    );
  }
}
