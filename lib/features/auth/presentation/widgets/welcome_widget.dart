import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            "Welcome to OasisNow",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Satoshi Variable",
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ),
        6.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.sp),
          child: Text(
            "The best cooking and the best care from our professional hands to your plate",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Satoshi Variable",
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffffffff).withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
