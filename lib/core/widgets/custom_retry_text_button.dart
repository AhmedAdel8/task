import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/core/theming/colors.dart' show AppColors;

class CustomRetryTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomRetryTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.refresh),
        label: Text(
          "retry".tr(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
