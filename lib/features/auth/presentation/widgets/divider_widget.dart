import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: const Color(0xffD9D9D9), thickness: 1.sp),
        ),
        const Text(
          "or",
          style: TextStyle(
            fontFamily: "Satoshi Variable",
            letterSpacing: -0.3,
            color: Color(0xffAAAAAA),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Expanded(
          child: Divider(color: const Color(0xffD9D9D9), thickness: 1.sp),
        ),
      ],
    );
  }
}
