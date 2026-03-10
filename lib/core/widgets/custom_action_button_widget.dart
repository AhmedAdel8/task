import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActionButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;

  const CustomActionButtonWidget({
    super.key,
    required this.onTap,

    this.icon = Icons.add,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 18),
            SizedBox(width: 6.w),
            Text(
              'add'.tr(),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}