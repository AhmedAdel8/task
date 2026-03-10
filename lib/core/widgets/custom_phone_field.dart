import 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/text_styles.dart';

class CustomPhoneTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final FocusNode? focusNode;
  final String? initialCountryCode;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? focusedHintColor;
  final Color? backgroundColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final ValueChanged<Country>? onCountry;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool showShadow;
  final bool? readOnly;

  const CustomPhoneTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.readOnly,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.initialCountryCode,
    this.focusedBorderColor,
    this.borderColor,
    this.focusedHintColor,
    this.backgroundColor,
    this.borderRadius = 12,
    this.height,
    this.width,
    this.onCountry,
    this.prefixIcon,
    this.suffixIcon,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      child: Builder(
        builder: (context) {
          final bool isFocused = Focus.of(context).hasFocus;

          final Color currentBorderColor = isFocused
              ? focusedBorderColor ?? AppColors.primaryColor
              : borderColor ?? AppColors.borderColor;

          final TextStyle currentHintStyle =
              (hintStyle ?? Styles.textStyle14W400).copyWith(
                color: isFocused
                    ? focusedHintColor ?? AppColors.primaryColor
                    : AppColors.greyDark,
              );

          return Directionality(
            textDirection: TextDirection.ltr,
            child: IntlPhoneField(
              readOnly: readOnly ?? false,
              controller: controller,
              autovalidateMode: AutovalidateMode.always,
              focusNode: focusNode,
              languageCode: 'en',
              initialCountryCode: initialCountryCode ?? 'SA',
              onCountryChanged: onCountry,
              onChanged: onChanged,
              validator: validator,
              style:
                  textStyle ??
                  Styles.textStyle14W500.copyWith(
                    color: AppColors.darkTextColor,
                    fontWeight: FontWeight.w500,
                  ),
              invalidNumberMessage: 'invalidPhoneNumber'.tr(),
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(
                Icons.arrow_drop_down_rounded,
                color: isFocused
                    ? focusedBorderColor ?? AppColors.primaryColor
                    : AppColors.greyDark,
                size: 24.sp,
              ),
              flagsButtonPadding: EdgeInsets.symmetric(horizontal: 12.w),
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: Colors.white,
                listTileDivider: const Divider(
                  height: 0,
                  color: AppColors.borderColor,
                ),
                padding: EdgeInsets.all(20.w),
                countryNameStyle: Styles.textStyle14W500.copyWith(
                  color: AppColors.darkTextColor,
                  fontWeight: FontWeight.w500,
                ),
                countryCodeStyle: Styles.textStyle14W600.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                searchFieldInputDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'search'.tr(),
                  hintStyle: Styles.textStyle14W400.copyWith(
                    color: AppColors.greyDark,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.primaryColor,
                    size: 22.sp,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 1.5.sp,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.sp,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: backgroundColor ?? Colors.white,
                labelText: labelText,
                labelStyle: Styles.textStyle14W500.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                hintText: hintText,
                hintStyle: currentHintStyle,
                prefixIcon: prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        child: Icon(
                          prefixIcon,
                          color: isFocused
                              ? focusedBorderColor ?? AppColors.primaryColor
                              : AppColors.greyDark,
                          size: 20.sp,
                        ),
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 12.w, left: 8.w),
                        child: Icon(
                          suffixIcon,
                          color: isFocused
                              ? focusedBorderColor ?? AppColors.primaryColor
                              : AppColors.greyDark,
                          size: 20.sp,
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: currentBorderColor,
                    width: 1.5.sp,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: currentBorderColor,
                    width: 2.sp,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: Colors.red.shade400,
                    width: 1.5.sp,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: Colors.red.shade600,
                    width: 2.sp,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width ?? 16.w,
                  vertical: height ?? 16.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
