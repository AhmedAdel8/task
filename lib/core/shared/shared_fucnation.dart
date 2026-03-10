import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

String buildErrorText(String message) {
  return Text(
    message,
    style: Styles.textStyle14W600.copyWith(color: AppColors.errorColor),
  ).data!;
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> launchPhone(String phone) async {
  final String cleanedPhone = phone.replaceAll(RegExp(r'[^\d+]'), '').trim();
  final Uri uri = Uri.parse('tel:$cleanedPhone');

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

ImageProvider getProfileImage(String? apiImage, String assetImage) {
  if (apiImage != null && apiImage.isNotEmpty) {
    return NetworkImage(apiImage);
  }
  if (assetImage.isNotEmpty) {
    return AssetImage(assetImage);
  }
  return const AssetImage('assets/images/pngs/no_profile_image.png');
}

Future<void> pickTime(
  BuildContext context,
  TextEditingController controller,
) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a', 'en_US').format(
      DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      ),
    );

    controller.text = formattedTime;
  }
}

Future<File?> pickAndCompressImage({
  required ImageSource source,
  int quality = 70,
}) async {
  try {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return null;

    final Directory tempDir = await getTemporaryDirectory();
    if (!tempDir.existsSync()) {
      tempDir.createSync(recursive: true);
    }

    final String targetPath = path.join(
      tempDir.path,
      '${DateTime.now().millisecondsSinceEpoch}${path.extension(pickedFile.path)}',
    );

    final XFile? compressedXFile =
        await FlutterImageCompress.compressAndGetFile(
          pickedFile.path,
          targetPath,
          quality: quality,
        );

    final File resultFile = File((compressedXFile ?? pickedFile).path);

    return resultFile;
  } catch (e) {
    debugPrint('Error picking/compressing image: $e');
    return null;
  }
}
