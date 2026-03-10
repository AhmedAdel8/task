import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/auth/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<String> row1Images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  final List<String> row2Images = [
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 240.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 110.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: row1Images.length,
                      separatorBuilder: (_, __) => 7.horizontalSpace,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(7.r),
                          child: Image.asset(
                            row1Images[index],
                            width: 90.w,
                            height: 121.h,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  7.verticalSpace,
                  SizedBox(
                    height: 110.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: row2Images.length,
                      separatorBuilder: (_, __) => 7.horizontalSpace,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(7.r),
                          child: Image.asset(
                            row2Images[index],
                            width: 90.w,
                            height: 121.h,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Welcome to OasisNow",

                      //   style: TextStyle(fontFamily: GoogleFonts.satosh,
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),

                    Text(
                      "The best cooking and the best care from our professional hands to your plate",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),

                    30.verticalSpace,

                    const CustomButton(
                      text: "Continue with Apple",
                      iconData: Icons.apple,
                      color: Colors.transparent,
                      textColor: Colors.white,
                      borderSide: BorderSide(color: Colors.orange),
                    ),

                    12.verticalSpace,

                    const CustomButton(
                      text: "Continue with Google",
                      iconData: Icons.g_mobiledata,
                      color: Colors.transparent,
                      textColor: Colors.white,
                      borderSide: BorderSide(color: Colors.orange),
                    ),

                    20.verticalSpace,

                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text(
                            "or",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.orange, fontSize: 12.sp),
                      ),
                    ),

                    25.verticalSpace,

                    CustomButton(
                      text: "Login",
                      gradientColors: const [Colors.orange, Colors.deepOrange],
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login();
                        }
                      },
                    ),

                    20.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),

                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageItem(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.r),
      child: Image.asset(image, width: 120.w, height: 110.h, fit: BoxFit.cover),
    );
  }
}
