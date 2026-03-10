import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:task/core/widgets/custom_phone_field.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    super.key,
    required this.controller,
    required this.onPhoneChanged,
    required this.validation,
  });
  final String validation;
  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;

  @override
  Widget build(BuildContext context) {
    return CustomPhoneTextFormField(
      controller: controller,
      backgroundColor: const Color(0xffF8F8F8),

      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),

      hintStyle: const TextStyle(color: Color(0xffAAAAAA)),
      // labelText: 'phone'.tr(),
      hintText: "0XXXXXXXX",
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return validation;
        }
        return null;
      },
      onChanged: (v) {
        onPhoneChanged(v.completeNumber);
      },
    );
  }
}

class EditPhoneWidget extends StatefulWidget {
  final String phone;
  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;

  const EditPhoneWidget({
    super.key,
    required this.phone,
    required this.controller,
    required this.onPhoneChanged,
  });

  @override
  State<EditPhoneWidget> createState() => _EditPhoneWidgetState();
}

class _EditPhoneWidgetState extends State<EditPhoneWidget> {
  String? _initialCountryCode;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _parseAndSet(widget.phone);
  }

  void _parseAndSet(String fullPhone) {
    final normalized = fullPhone.replaceFirst('+', '');
    for (final country in countries) {
      final dialCode = country.dialCode.replaceAll('+', '');
      if (normalized.startsWith(dialCode)) {
        final localNumber = normalized.substring(dialCode.length);
        widget.controller.text = localNumber;
        _initialCountryCode = country.code;
        _isInitialized = true;
        setState(() {});
        return;
      }
    }

    widget.controller.text = normalized;
    _initialCountryCode = 'US';
    _isInitialized = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const CircularProgressIndicator();
    }

    return CustomPhoneTextFormField(
      controller: widget.controller,
      initialCountryCode: _initialCountryCode,
      readOnly: true,
      onChanged: (PhoneNumber number) {
        widget.onPhoneChanged(number.completeNumber);
      },
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return 'phone'.tr();
        }
        return null;
      },
    );
  }
}
