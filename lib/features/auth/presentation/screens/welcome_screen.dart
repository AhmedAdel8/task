import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_text_form_field.dart';
import 'package:task/features/auth/cubit/auth_cubit.dart';
import 'package:task/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:task/features/auth/presentation/widgets/custom_soical_button_widget.dart';
import 'package:task/features/auth/presentation/widgets/divider_widget.dart';
import 'package:task/features/auth/presentation/widgets/image_row_widget.dart';
import 'package:task/features/auth/presentation/widgets/welcome_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final cubit = context.read<AuthCubit>();
                          return Column(
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                transitionBuilder: (child, animation) =>
                                    FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    ),
                                child: cubit.showSignUp
                                    ? const SignUpSectionWidget()
                                    : const SocialSectionWidget(),
                              ),
                              10.verticalSpace,
                              if (cubit.showSignUp == false)
                                const AlreadyHaveAccountWidget(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          height: 50.sp,
          fontWeight: FontWeight.w400,
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

class SignUpSectionWidget extends StatelessWidget {
  const SignUpSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
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
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
              ),
              10.verticalSpace,
              CustomTextFormField(
                controller: cubit.signUpPasswordController,
                hintText: "Password",
                obscureText: cubit.isPasswordObscured,
                backgroundColor: const Color(0xFF1C1C1C),
                borderColor: const Color(0XFF323232),
                borderRadius: BorderRadius.circular(11.r),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    cubit.isPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white38,
                    size: 20.sp,
                  ),
                  onPressed: cubit.togglePasswordVisibility,
                ),
              ),
              10.verticalSpace,
              CustomTextFormField(
                controller: cubit.signUpRePasswordController,
                hintText: "Re-enter Password",
                obscureText: cubit.isRePasswordObscured,
                backgroundColor: const Color(0xFF1C1C1C),
                borderColor: const Color(0XFF323232),
                borderRadius: BorderRadius.circular(11.r),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    cubit.isRePasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white38,
                    size: 20.sp,
                  ),
                  onPressed: cubit.toggleRePasswordVisibility,
                ),
              ),
              15.verticalSpace,
              InkWell(
                onTap: cubit.validateAndSignUp,
                child: Container(
                  height: 50.sp,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5.w,
                      color: const Color(0Xffffffff).withValues(alpha: 0.51),
                    ),
                    borderRadius: BorderRadius.circular(16.sp),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              if (state is AuthStateSignUpError) ...[
                8.verticalSpace,
                Text(
                  state.message,
                  style: TextStyle(
                    color: const Color(0xFFA91C1C),
                    fontSize: 12.sp,
                  ),
                ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3, end: 0),
              ],
            ],
          ),
        );
      },
    );
  }
}
