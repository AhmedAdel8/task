import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ",
          style: TextStyle(
            fontWeight: FontWeight.w700,

            color: const Color(0xffAAAAAA),
            fontSize: 12.sp,
          ),
        ),
        3.horizontalSpace,
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],

            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Satoshi",
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
