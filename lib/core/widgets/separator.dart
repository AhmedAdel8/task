import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

class Separator extends StatelessWidget {
  const Separator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 1.h,
      color: color ?? const Color(0xffA8A8A9),
    );
  }
}

class OfferSepartor extends StatelessWidget {
  const OfferSepartor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 3.w, height: 10.h, color: AppColors.primaryColor);
  }
}
