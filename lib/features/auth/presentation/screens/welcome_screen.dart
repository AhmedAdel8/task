import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants.dart';
import 'package:task/features/auth/cubit/auth_cubit.dart';
import 'package:task/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:task/features/auth/presentation/widgets/image_row_widget.dart';
import 'package:task/features/auth/presentation/widgets/sign_up_section_widget.dart';
import 'package:task/features/auth/presentation/widgets/social_section_widget.dart';
import 'package:task/features/auth/presentation/widgets/welcome_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ImageRowWidget(images: row1Images, reverseDirection: true),
            7.verticalSpace,
            ImageRowWidget(images: row2Images, reverseDirection: false),

            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const WelcomeWidget(),
                    30.verticalSpace,
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
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
    );
  }
}
