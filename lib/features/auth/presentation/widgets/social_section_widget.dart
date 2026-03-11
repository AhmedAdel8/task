import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/auth/cubit/auth_cubit.dart';
import 'package:task/features/auth/presentation/widgets/custom_soical_button_widget.dart';
import 'package:task/features/auth/presentation/widgets/divider_widget.dart';

class SocialSectionWidget extends StatelessWidget {
  const SocialSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSoicalButtonWidget(),
        16.verticalSpace,
        const DividerWidget(),
        25.verticalSpace,
        CustomButton(
          fontSize: 13.sp,
          height: 50.sp,
          fontWeight: FontWeight.w700,
          borderRadius: 16.sp,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          text: "Continue with OasisNow",
          color: const Color(0XFF323232),
          textColor: Colors.white,
          onPressed: () => context.read<AuthCubit>().onContinueWithOasis(),
        ),
      ],
    );
  }
}
