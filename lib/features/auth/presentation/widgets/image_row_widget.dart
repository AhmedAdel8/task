import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageRowWidget extends StatefulWidget {
  final List<String> images;
  final bool reverseDirection;

  const ImageRowWidget({
    super.key,
    required this.images,
    this.reverseDirection = false,
  });

  @override
  State<ImageRowWidget> createState() => _ImageRowWidgetState();
}

class _ImageRowWidgetState extends State<ImageRowWidget> {
  late final ScrollController _scrollController;
  Timer? _timer;
  late final List<String> _repeatedImages;

  @override
  void initState() {
    super.initState();
    _repeatedImages = [...widget.images, ...widget.images, ...widget.images];
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent / 2,
        );
      }
      _startScroll();
    });
  }

  void _startScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      double next =
          _scrollController.offset + (widget.reverseDirection ? -0.6 : 0.6);
      if (next >= max) next = max / 3;
      if (next <= 0) next = max * 2 / 3;
      _scrollController.jumpTo(next);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemCount: _repeatedImages.length,
        separatorBuilder: (_, __) => 7.horizontalSpace,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Image.asset(
              _repeatedImages[index],
              width: 90.w,
              height: 121.h,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
