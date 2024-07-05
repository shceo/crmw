// ignore_for_file: unused_element

import 'package:common/common_utils_export.dart';
import 'package:common/src/theme/crm_theme.dart';
import 'package:common/src/utils/constants/fonts_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _blueRyb = Color(0xFF0050FF);
const _white = Color(0xFFFFFFFF);
const _ghostWhite = Color(0xFFF9FAFC);
const _lightSilver = Color(0xFFD0D4DD);
const _auroMetalSaurusr = Color(0xFF667085);
const _carminePink = Color(0xFFF04438);
const _darkJungleGreen = Color(0xFF101828);
const _romanSilver = Color(0xFF8391A1);
const _greenCrayola = Color(0xFF16B364);
const _metallicOrange = Color(0xFFDC6803);
const _britishRacingGreen = Color(0xFF03482A);
const _coolBlack = Color(0xFF022169);
const _bloodOrgan = Color(0xFF601409);
const _azureishWhite = Color(0xFFDBE8FF);
const _brightGray = Color(0xffE4E8EE);
const _blackOlive = Color(0xff3e3e3e);
const _independence = Color(0xff675A47);
const _paleCornflowerBlue = Color(0xffFFE8B2);
const _lavenderBlush = Color(0xffFFF3F3);
const _black = Color(0xFF000000);
const _grey = Color(0xFF697386);
const _calendarBorderColor = Color(0xFFD0D5DD);

const _transparent = Color(0x00000000);

const lightTheme = CrmTheme(
  isDark: false,
  mainColor: _blueRyb,
  secondaryColor: _white,
  tertiaryColor: _ghostWhite,
  quaternaryColor: _lightSilver,
  fiveFoldColor: _auroMetalSaurusr,
  sixFoldColor: _azureishWhite,
  sevenFoldColor: _brightGray,
  eightFoldColor: _blackOlive,
  nineFoldColor: _independence,
  tenFoldColor: _paleCornflowerBlue,
  elevenFoldColor: _lavenderBlush,
  defaultIconColor: _auroMetalSaurusr,
  secondaryIconColor: _auroMetalSaurusr,
  textFieldColor: _ghostWhite,
  errorColor: _carminePink,
  transparent: _transparent,
  primaryTextColor: _darkJungleGreen,
  secondaryTextColor: _romanSilver,
  tertiaryTextColor: _blueRyb,
  quaternaryTextColor: _white,
  fivefoldTextColor: _darkJungleGreen,
  assistiveTextColor: _darkJungleGreen,
  bottomNavBarBackgroundColor: _black,
  activeIconNavBarColor: _blueRyb,
  inactiveIconNavBarColor: _white,
  orangeColor: _metallicOrange,
  redColor: _carminePink,
  greenColor: _greenCrayola,
  greyColor: _grey,
  calendarBorderColor: _calendarBorderColor,
  fontFamily: FontsAssets.interFamily,
  divider: _lightSilver,
  statusBarBrightness: Brightness.dark,
  navigationBarBrightness: Brightness.light,
);

ThemeData generateThemeData(CrmTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: theme.secondaryColor,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.mainColor,
      selectionHandleColor: theme.mainColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: CommonFonts.regular,
        fontSize: CommonFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: CommonFonts.semiBold,
        fontSize: CommonFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: CommonFonts.semiBold,
        fontSize: CommonFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: CommonFonts.regular,
        fontSize: CommonFonts.sizeDisplayMedium,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: CommonFonts.semiBold,
        fontSize: CommonFonts.sizeHeadlineMedium,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: CommonFonts.semiBold,
        fontSize: CommonFonts.sizeHeadlineSmall,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: CommonFonts.regular,
        fontSize: CommonFonts.sizeHeadlineSmall,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: CommonFonts.semiBold,
        fontSize: CommonFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: CommonFonts.regular,
        fontSize: CommonFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparent,
        statusBarIconBrightness: theme.statusBarBrightness,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
