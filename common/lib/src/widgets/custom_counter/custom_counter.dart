// ignore_for_file: avoid_dynamic_calls

import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CustomCounter extends StatefulWidget {
  // final VoidCallback onIncrementPressed;
  // final VoidCallback onDecrementPressed;
  // final ValueChanged<double> onDecrementChanged;
  // final ValueChanged<double> onIncrementChanged;
  // final ValueChanged<double> onCountChanged;
  final int? initNumber;
  final Function(int)? counterCallback;
  final Function? increaseCallback;
  final Function? decreaseCallback;
  final int? minNumber;
  final int? maxNumber;
  const CustomCounter({
    // required this.onIncrementPressed,
    // required this.onDecrementPressed,
    // required this.onDecrementChanged,
    // required this.onIncrementChanged,
    // required this.onCountChanged,
    this.initNumber,
    this.counterCallback,
    this.increaseCallback,
    this.decreaseCallback,
    this.minNumber,
    this.maxNumber,
    super.key,
  });

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;
  late int _maxNumber;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    _minNumber = widget.minNumber ?? 0;
    _maxNumber = widget.maxNumber ?? 100;
  }

  void _increment() {
    setState(() {
      if (_currentCount < _maxNumber) {
        _currentCount++;
        _counterCallback(_currentCount);
        _increaseCallback();
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomVectorButton(
          isSmall: true,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.mediumLarge,
              ),
            ),
            side: BorderSide(
              color: context.theme.quaternaryColor,
            ),
          ),
          assetPath: CommonAssets.minusIcon,
          assetHeight: CommonDimensions.mediumLarge,
          assetWidth: CommonDimensions.mediumLarge,
          onPressed: _decrement,
        ),
        const SizedBox(width: CommonDimensions.large),
        Text(
          '$_currentCount',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.tertiaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(width: CommonDimensions.large),
        CustomVectorButton(
          isSmall: true,
          backgroundColor: context.theme.mainColor.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.mediumLarge,
              ),
            ),
            side: BorderSide(
              color: context.theme.mainColor.withOpacity(.3),
            ),
          ),
          assetPath: CommonAssets.plusIcon,
          assetColor: context.theme.mainColor,
          assetHeight: CommonDimensions.mediumLarge,
          assetWidth: CommonDimensions.mediumLarge,
          onPressed: _increment,
        ),
      ],
    );
    // return CustomizableCounter(
    //   backgroundColor: context.theme.secondaryColor,
    //   borderColor: context.theme.secondaryColor,
    //   decrementIcon: CustomVectorButton(
    //     assetPath: CommonAssets.minusIcon,
    //     assetHeight: CommonDimensions.mediumLarge,
    //     assetWidth: CommonDimensions.mediumLarge,
    //     onPressed: onDecrementPressed,
    //   ),
    //   incrementIcon: CustomVectorButton(
    //     backgroundColor: context.theme.mainColor.withOpacity(.1),
    //     assetColor: context.theme.mainColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: const BorderRadius.all(
    //         Radius.circular(
    //           CommonDimensions.large,
    //         ),
    //       ),
    //       side: BorderSide(
    //         color: context.theme.mainColor.withOpacity(.4),
    //       ),
    //     ),
    //     assetPath: CommonAssets.plusIcon,
    //     assetHeight: CommonDimensions.mediumLarge,
    //     assetWidth: CommonDimensions.mediumLarge,
    //     onPressed: onIncrementPressed,
    //   ),
    //   textSize: CommonFonts.sizeHeadlineSmall,
    //   showButtonText: false,
    //   textColor: context.theme.tertiaryTextColor,
    //   onDecrement: onDecrementChanged,
    //   onIncrement: onIncrementChanged,
    //   onCountChange: onCountChanged,
    // );
  }
}
