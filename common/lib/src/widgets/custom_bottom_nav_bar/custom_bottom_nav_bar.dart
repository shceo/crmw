// ignore_for_file: unused_element

import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<CustomNavigationItem> items;
  final ValueChanged<int>? onIndexChanged;
  const CustomNavigationBar({
    required this.selectedIndex,
    required this.items,
    this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CommonDimensions.large),
      height: kBottomNavigationBarHeight,
      width: context.adaptiveDeviceWidth,
      decoration: BoxDecoration(
        color: context.theme.bottomNavBarBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int index = 0; index < items.length; index++)
            _CustomNavigationItem(
              itemIndex: index,
              selectedIndex: selectedIndex,
              iconPath: items[index].iconPath,
              onIndexChanged: onIndexChanged,
            ),
        ],
      ),
    );
  }
}

class _CustomNavigationItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final String iconPath;
  final ValueChanged<int>? onIndexChanged;
  const _CustomNavigationItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.iconPath,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomVectorButton(
      backgroundColor: context.theme.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
        side: BorderSide(
          color: context.theme.transparent,
        ),
      ),
      assetPath: iconPath,
      assetColor: itemIndex == selectedIndex
          ? context.theme.activeIconNavBarColor
          : context.theme.inactiveIconNavBarColor,
      onPressed: () => onIndexChanged?.call(itemIndex),
    );
  }
}

final class CustomNavigationItem {
  final String iconPath;

  const CustomNavigationItem({required this.iconPath});
}
