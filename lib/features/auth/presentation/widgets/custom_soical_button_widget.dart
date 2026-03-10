import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/widgets/custom_button.dart';

class CustomSoicalButtonWidget extends StatelessWidget {
  const CustomSoicalButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          height: 50.sp,
          fontWeight: FontWeight.w400,
          image: "assets/images/apple.png",
          borderRadius: 16.sp,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          text: "Continue with Apple",
          color: Colors.black,
          textColor: Colors.white,
          borderSide: BorderSide(
            width: 1.5.sp,
            color: const Color(0xffffffff).withValues(alpha: 0.21),
          ),
        ),
        10.verticalSpace,
        CustomButton(
          height: 50.sp,
          fontWeight: FontWeight.w400,
          image: "assets/images/search.png",
          borderRadius: 16.sp,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          text: "Continue with Google",
          color: Colors.black,
          textColor: Colors.white,
          borderSide: BorderSide(
            width: 1.5.sp,
            color: const Color(0xffffffff).withValues(alpha: 0.21),
          ),
        ),
      ],
    );
  }
}
