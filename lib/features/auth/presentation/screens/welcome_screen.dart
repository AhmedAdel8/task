import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:task/features/auth/presentation/widgets/custom_soical_button_widget.dart';
import 'package:task/features/auth/presentation/widgets/divider_widget.dart';
import 'package:task/features/auth/presentation/widgets/image_row_widget.dart';
import 'package:task/features/auth/presentation/widgets/welcome_widget.dart';

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
                  ImageRowWidget(images: row1Images, reverseDirection: true),
                  7.verticalSpace,
                  ImageRowWidget(images: row2Images, reverseDirection: false),
                ],
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const WelcomeWidget(),
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
