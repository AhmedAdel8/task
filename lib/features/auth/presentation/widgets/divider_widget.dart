import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xffD9D9D9), thickness: 1)),
        Text(
          "or",
          style: TextStyle(
            color: Color(0xffAAAAAA),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Expanded(child: Divider(color: Color(0xffD9D9D9), thickness: 1)),
      ],
    );
  }
}
