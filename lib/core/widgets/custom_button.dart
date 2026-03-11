import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? image;
  final IconData? iconData;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderSide;
  final bool? isEnabled;
  final List<Color>? gradientColors;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    super.key,
    this.onPressed,
    this.image,
    this.iconData,
    this.text,
    this.color,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 18.0,
    this.borderSide,
    this.isEnabled = true,
    this.gradientColors,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled == false ? null : onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        height: height ?? 50.h,
        margin: margin,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
            
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderSide?.color ?? Colors.transparent),
          color: color ?? AppColors.primaryColor,
          boxShadow:
              boxShadow ??
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: -1,
                  blurRadius: 5.sp,
                ),
              ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[
              Image.asset(
                image!,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.contain,
              ),
            ],
            if (iconData != null) ...[
              Icon(iconData, color: textColor ?? Colors.white, size: 25.sp),
            ],
            if (text != null)
              Expanded(
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Satoshi Variable",
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
