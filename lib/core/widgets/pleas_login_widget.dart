import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/widgets/custom_button.dart';

class PleaseLoginWidget extends StatelessWidget {
  const PleaseLoginWidget({super.key, required this.appBarTitle});
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: 'pleaselogin'.tr(),
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.all(20.sp),
              onPressed: () {
                context.pushNamed(Routes.welcomeScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
