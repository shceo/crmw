import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common/common_theme_export.dart';
import 'package:flutter/widgets.dart';

class SimpleDropdown<T> extends StatelessWidget {
  final List<T> items;
  final Function(T)? onChanged;
  final CustomDropdownDecoration? customDropdownDecoration;
  final String? hintText;
  final Widget Function(BuildContext, String)? hintBuilder;
  final Widget Function(BuildContext, T)? headerBuilder;
  const SimpleDropdown({
    required this.items,
    required this.onChanged,
    this.customDropdownDecoration,
    this.hintText,
    this.hintBuilder,
    this.headerBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      closedHeaderPadding: EdgeInsets.zero,
      items: items,
      onChanged: onChanged,
      hintText: hintText,
      decoration: customDropdownDecoration ??
          CustomDropdownDecoration(
            closedFillColor: context.theme.textFieldColor,
            closedBorder: Border.all(
              color: context.theme.quaternaryColor,
            ),
          ),
      hintBuilder: hintBuilder,
      headerBuilder: headerBuilder,
    );
  }
}
