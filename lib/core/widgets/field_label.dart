import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final bool hasValidation;
  const FieldLabel(
    this.text, {
    super.key,
    this.hasValidation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text ${hasValidation ? '*' : ''} ",
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF374151),
      ),
    );
  }
}
