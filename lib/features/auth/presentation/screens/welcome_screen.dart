import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:task/features/auth/presentation/widgets/custom_soical_button_widget.dart';
import 'package:task/features/auth/presentation/widgets/divider_widget.dart';
import 'package:task/features/auth/presentation/widgets/image_row_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 290.h,
              child: Column(
                children: [
                  ImageRowWidget(images: row1Images, reverseDirection: false),
                  7.verticalSpace,
                  ImageRowWidget(images: row2Images, reverseDirection: true),
                ],
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          letterSpacing: -0.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      "The best cooking and the best care from our professional hands to your plate",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffffffff).withValues(alpha: 0.6),
                      ),
                    ),
                    35.verticalSpace,
                    const CustomSoicalButtonWidget(),
                    16.verticalSpace,
                    const DividerWidget(),
                    25.verticalSpace,
                    CustomButton(
                      height: 50.sp,
                      fontWeight: FontWeight.w400,
                      borderRadius: 16.sp,
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      text: "Continue with OasisNow",
                      color: const Color(0XFF323232),
                      textColor: Colors.white,
                    ),
                    10.verticalSpace,
                    const AlreadyHaveAccountWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
