// import 'package:flutter/material.dart';

// class AppColors {
//   // Primary Colors
//   static const primaryColor = Color(0xff026CA8);
//   static const secondaryColor = Color(0xffF2F7FA); // grayBackgroundColor
//   static const thirdColor = Color(0xff666B88); // grayTextColor
//   static const forthColor = Color(0xff0072BC); // buttonColor

//   static Color offerColor = const Color(0xff026CA8).withValues(alpha:0.7);

//   // Gray Colors
//   static const greyColor = Color(0xffF2F2F2);
//   static const borderColor = Color(0xffF2F2F2);
//   static const secondaryBorderColor = Color(0xffB9B9B9);
//   static const lightGrayBorderColor = Color(0xffEEEEEE);

//   // Text Colors
//   static const primaryTextColor = Color(0xff026CA8);
//   static const secondaryTextColor = Color(0xff7E7E7E); // grayHintTextColor
//   static const textGreyColor = Color(0xff666B88); // grayTextColor
//   static const grayHintTextColor = Color(0xff7E7E7E);

//   // Button Colors
//   static const buttonColor = Color(0xFF0072BC);
//   static const textButtonColor = Color(0xff026CA8);

//   // Status Colors
//   static const successColor = Color(0xFF28A745);
//   static const errorColor = Color(0xFFD32F2F);

//   // Background Colors
//   static const textFormFieldColor = Color(0xffF8F8F8); // textFieldColor
//   static const textFieldColor = Color(0xffF8F8F8);
//   static const scaffoldBackground = Colors.white;
//   static const bottomNavLightThemeBackground = Colors.white;
//   static const mainContainerColor2 = Color(0xffFCFCFC); // whiteLightColor
//   static const whiteLightColor = Color(0xffFCFCFC);
//   static const grayBackgroundColor = Color(0xffF2F7FA);

//   // Divider
//   static const dividerColor = Color(0xffDADADA);

//   // Legacy (kept for backward compatibility)
//   static const newBlackColor = Color(0xff0d0c0d);
// }

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Deep Blue
  static const primaryColor = Color(0xff026CA8);
  static const primaryLight = Color(0xff3A8EC4);
  static const primaryDark = Color(0xff014D7A);
  static const primarySurface = Color(
    0xffE6F3FA,
  ); // Very light blue for surfaces

  // Secondary Colors - Harmonious Cool Tones
  static const secondaryColor = Color(0xff4A90E2); // Softer blue
  static const secondaryLight = Color(0xff7DB3F5);
  static const secondaryDark = Color(0xff2B6CB0);

  // Accent Colors - Complementary Warm
  static const accentColor = Color(0xffFF8C42); // Coral orange
  static const accentLight = Color(0xffFFAA6B);
  static const accentDark = Color(0xffE67324);

  static Color offerColor = const Color(0xff026CA8).withValues(alpha: 0.7);

  // Gray Colors - Blue-tinted neutrals (to match primary)
  static const greyColor = Color(0xffF4F6F8);
  static const greyLight = Color(0xffF8FAFB);
  static const greyMedium = Color(0xffE5E9ED);
  static const greyDark = Color(0xffA0A8B0);

  static const borderColor = Color(0xffE5E9ED);
  static const secondaryBorderColor = Color(0xffC1C9D2);
  static const lightGrayBorderColor = Color(0xffF0F2F5);

  // Text Colors - Blue-based hierarchy
  static const primaryTextColor = Color(0xff026CA8);
  static const secondaryTextColor = Color(0xff6B7280);
  static const textGreyColor = Color(0xff4B5563);
  static const grayHintTextColor = Color(0xff9CA3AF);
  static const darkTextColor = Color(0xff1F2937);

  // Button Colors
  static const buttonColor = Color(0xff026CA8);
  static const secondaryButtonColor = Color(0xff4A90E2);
  static const textButtonColor = Color(0xff026CA8);
  static const disabledButtonColor = Color(0xffD1D5DB);

  // Status Colors - Matching the blue theme
  static const successColor = Color(0xff10B981); // Modern green
  static const errorColor = Color(0xffEF4444); // Modern red
  static const warningColor = Color(0xffF59E0B); // Amber
  static const infoColor = Color(0xff3A8EC4); // Light blue

  // Background Colors - Blue-tinted whites
  static const scaffoldBackground = Color(0xFFF5F6FA);
  static const textFormFieldColor = Color(0xffffffff);
  static const textFieldColor = Color(0xffF4F6F8);
  static const bottomNavLightThemeBackground = Color(0xffFFFFFF);
  static const cardBackground = Color(0xffFFFFFF);
  static const mainContainerColor2 = Color(0xffFDFDFE);
  static const whiteLightColor = Color(0xffFDFDFE);
  static const grayBackgroundColor = Color(0xffF0F4F8); // Blue-tinted gray
  static const surfaceLight = Color(0xffF8FAFB);

  // Divider - Subtle blue-gray
  static const dividerColor = Color(0xffE5E9ED);
  static const dividerLight = Color(0xffF0F2F5);

  // Legacy
  static const newBlackColor = Color(0xff0d0c0d);
}
