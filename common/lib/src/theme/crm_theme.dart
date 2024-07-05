import 'dart:ui';

import 'package:equatable/equatable.dart';

final class CrmTheme extends Equatable {
  final bool isDark;

  final Color mainColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color fiveFoldColor;
  final Color sixFoldColor;
  final Color sevenFoldColor;
  final Color eightFoldColor;
  final Color nineFoldColor;
  final Color tenFoldColor;
  final Color elevenFoldColor;
  final Color textFieldColor;
  final Color errorColor;
  final Color transparent;
  final Color greyColor;
  final Color calendarBorderColor;

  final Color defaultIconColor;
  final Color secondaryIconColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color quaternaryTextColor;
  final Color fivefoldTextColor;
  final Color assistiveTextColor;

  final Color bottomNavBarBackgroundColor;
  final Color activeIconNavBarColor;
  final Color inactiveIconNavBarColor;

  final Color orangeColor;
  final Color redColor;
  final Color greenColor;
  final String fontFamily;
  final Color divider;

  final Brightness statusBarBrightness;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
        isDark,
        mainColor,
        secondaryColor,
        tertiaryColor,
        quaternaryColor,
        fiveFoldColor,
        sixFoldColor,
        sevenFoldColor,
        eightFoldColor,
        nineFoldColor,
        tenFoldColor,
        elevenFoldColor,
        defaultIconColor,
        secondaryIconColor,
        textFieldColor,
        errorColor,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        tertiaryTextColor,
        quaternaryTextColor,
        fivefoldTextColor,
        assistiveTextColor,
        bottomNavBarBackgroundColor,
        activeIconNavBarColor,
        inactiveIconNavBarColor,
        orangeColor,
        redColor,
        greenColor,
        fontFamily,
        divider,
        statusBarBrightness,
        navigationBarBrightness,
      ];

  const CrmTheme({
    required this.isDark,
    required this.mainColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.fiveFoldColor,
    required this.greyColor,
    required this.calendarBorderColor,
    required this.sixFoldColor,
    required this.sevenFoldColor,
    required this.eightFoldColor,
    required this.nineFoldColor,
    required this.tenFoldColor,
    required this.elevenFoldColor,
    required this.defaultIconColor,
    required this.secondaryIconColor,
    required this.textFieldColor,
    required this.errorColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.quaternaryTextColor,
    required this.fivefoldTextColor,
    required this.assistiveTextColor,
    required this.bottomNavBarBackgroundColor,
    required this.activeIconNavBarColor,
    required this.inactiveIconNavBarColor,
    required this.orangeColor,
    required this.redColor,
    required this.greenColor,
    required this.fontFamily,
    required this.divider,
    required this.statusBarBrightness,
    required this.navigationBarBrightness,
  });
}
