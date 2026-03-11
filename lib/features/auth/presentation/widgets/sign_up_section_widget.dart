import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_text_form_field.dart';
import 'package:task/features/auth/cubit/auth_cubit.dart';

class SignUpSectionWidget extends StatelessWidget {
  const SignUpSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.signUpEmailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            backgroundColor: const Color(0xFF242424),
            borderColor: const Color(0XFF323232),
            borderRadius: BorderRadius.circular(11.r),
            hintStyle: TextStyle(
              fontFamily: "Satoshi Variable",
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            textStyle: TextStyle(
              fontFamily: "Satoshi Variable",
              color: Colors.white,
              fontSize: 12.sp,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
          10.verticalSpace,
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                current is AuthStateChangePasswordVisibility,
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.signUpPasswordController,
                hintText: "Password",
                obscureText: cubit.isPasswordObscured,
                backgroundColor: const Color(0xFF242424),
                borderColor: const Color(0XFF323232),
                borderRadius: BorderRadius.circular(11.r),
                hintStyle: TextStyle(
                  fontFamily: "Satoshi Variable",
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: "Satoshi Variable",
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                suffixIcon: InkWell(
                  onTap: cubit.togglePasswordVisibility,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF323232),
                    ),
                    child: Icon(
                      cubit.isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white38,
                      size: 15.sp,
                    ),
                  ),
                ),
              );
            },
          ),
          10.verticalSpace,
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                current is AuthStateChangeRePasswordVisibility,
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.signUpRePasswordController,
                hintText: "Re-enter Password",
                obscureText: cubit.isRePasswordObscured,
                backgroundColor: const Color(0xFF242424),
                borderColor: const Color(0XFF323232),
                borderRadius: BorderRadius.circular(11.r),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: "Satoshi Variable",
                  fontWeight: FontWeight.w700,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: "Satoshi Variable",
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                suffixIcon: InkWell(
                  onTap: cubit.toggleRePasswordVisibility,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF323232),
                    ),
                    child: Icon(
                      cubit.isRePasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white38,
                      size: 15.sp,
                    ),
                  ),
                ),
              );
            },
          ),
          15.verticalSpace,
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                current is AuthStateSignUpError ||
                current is AuthStateSignUpSuccess,
            builder: (context, state) {
              return Column(
                children: [
                  CustomButton(
                    borderSide: BorderSide(
                      color: const Color(0Xffffffff).withValues(alpha: 0.51),
                      width: 1.5.w,
                    ),
                    gradientColors: const [
                      Color(0xFFE4B679),
                      Color(0xFFFEE5C4),
                    ],
                    height: 50.sp,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    borderRadius: 16.sp,
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    text: "Sign Up",
                    textColor: Colors.black,
                    onPressed: cubit.validateAndSignUp,
                  ),
                  if (state is AuthStateSignUpError) ...[
                    8.verticalSpace,
                    Text(
                          state.message,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFA91C1C),
                            fontSize: 12.sp,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.3, end: 0),
                  ],
                  if (state is AuthStateSignUpSuccess) ...[
                    8.verticalSpace,
                    Text(
                          state.message,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                            fontSize: 12.sp,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.3, end: 0),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
