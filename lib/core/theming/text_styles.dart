import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/core/theming/colors.dart';

class AppFontConfig {
  static TextStyle Function({required TextStyle textStyle}) get fontFamily =>
      GoogleFonts.lato;

  static TextStyle buildTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return fontFamily(
      textStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color ?? AppColors.textGreyColor,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}

abstract class Styles {
  static final textStyle9W400 = AppFontConfig.buildTextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
  );

  static final textStyle10W400 = AppFontConfig.buildTextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static final textStyle12W400 = AppFontConfig.buildTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final textStyle12W700 = AppFontConfig.buildTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static final textStyle13W500 = AppFontConfig.buildTextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final textStyle14W300 = AppFontConfig.buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static final textStyle14W400 = AppFontConfig.buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final textStyle14W500 = AppFontConfig.buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final textStyle14W600 = AppFontConfig.buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final textStyle15W300 = AppFontConfig.buildTextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );

  static final textStyle15W700 = AppFontConfig.buildTextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static final textStyle16W400 = AppFontConfig.buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final textStyle16W500 = AppFontConfig.buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final textStyle16W600 = AppFontConfig.buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final textStyle18W300 = AppFontConfig.buildTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static final textStyle18W500 = AppFontConfig.buildTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final textStyle18W600 = AppFontConfig.buildTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final textStyle20W500 = AppFontConfig.buildTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final textStyle20W600 = AppFontConfig.buildTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final textStyle22W500 = AppFontConfig.buildTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final textStyle22W600 = AppFontConfig.buildTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static final textStyle22W700 = AppFontConfig.buildTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static final textStyle26W600 = AppFontConfig.buildTextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static final textStyle28W600 = AppFontConfig.buildTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static final textStyle30W300 = AppFontConfig.buildTextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w300,
  );

  static final textStyle32W700 = AppFontConfig.buildTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static final textStyle18 = AppFontConfig.buildTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final textStyle20 = AppFontConfig.buildTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static final textStyle22 = AppFontConfig.buildTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final textStyle24W500 = AppFontConfig.buildTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  static final textStyle26 = AppFontConfig.buildTextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );

  static final textStyle30 = AppFontConfig.buildTextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );

  static final textStyle14 = AppFontConfig.buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final textStyle16 = AppFontConfig.buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final textStyle64W400 = AppFontConfig.buildTextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
  );
}
