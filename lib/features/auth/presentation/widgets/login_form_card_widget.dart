// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task/core/widgets/custom_button.dart';
// import 'package:task/core/widgets/custom_text_form_field.dart';
// import 'package:task/features/auth/cubit/auth_cubit.dart';

// class LoginFormCardWidget extends StatelessWidget {
//   final AuthCubit cubit;

//   const LoginFormCardWidget({super.key, required this.cubit});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w),
//       padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 28.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(28.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.12),
//             blurRadius: 30,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Form(
//         key: cubit.loginFormKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'email'.tr(),
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF374151),
//               ),
//             ),
//             // LoginFieldLabel('email'.tr()),
//             SizedBox(height: 6.h),
//             CustomTextFormField(
//               controller: cubit.emailController,
//               hintText: 'email'.tr(),
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) {
//                 if (value == null || value.trim().isEmpty) {
//                   return 'emailValidation'.tr();
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16.h),
//             Text(
//               'password'.tr(),
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF374151),
//               ),
//             ),
//             // LoginFieldLabel('password'.tr()),
//             SizedBox(height: 6.h),
//             BlocBuilder<AuthCubit, AuthState>(
//               buildWhen: (previous, current) =>
//                   current is AuthStateChangePasswordVisibility,
//               builder: (context, state) {
//                 return CustomTextFormField(
//                   controller: cubit.passwordController,
//                   hintText: 'password'.tr(),
//                   obscureText: cubit.isPasswordObscured,
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'passwordValidation'.tr();
//                     }
//                     return null;
//                   },
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       cubit.isPasswordObscured
//                           ? Icons.visibility_off_outlined
//                           : Icons.visibility_outlined,
//                       color: const Color(0xFF8A94A6),
//                     ),
//                     onPressed: () => cubit.togglePasswordVisibility(),
//                   ),
//                 );
//               },
//             ),

//             Align(
//               alignment: Alignment.topLeft,
//               child: TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 4.h),
//                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 ),
//                 child: Text(
//                   'forgotPassword'.tr(),
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     color: const Color(0xFF4F46E5),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.h),
//             BlocListener<AuthCubit, AuthState>(
//               listenWhen: (previous, current) =>
//                   current is AuthStateLoginSuccess,
//               listener: (context, state) {
//                 if (state is AuthStateLoginSuccess) {}
//               },
//               child: CustomButton(
//                 text: 'login'.tr(),
//                 onPressed: () => cubit.login(),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF4F46E5).withValues(alpha: 0.35),
//                     blurRadius: 20,
//                     offset: const Offset(0, 8),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20.h),
//           ],
//         ),
//       ),
//     ).animate().scaleXY(duration: 500.ms).fadeIn(duration: 500.ms);
//   }
// }
