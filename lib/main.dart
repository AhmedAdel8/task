import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/bloc_observer.dart';
import 'package:task/core/cache_helper/cache_helper.dart';
import 'package:task/core/cache_helper/cache_values.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/di.dart';
import 'package:task/core/routing/app_router.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/theming/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await setupGetIt();

  await EasyLocalization.ensureInitialized();
  // await DioHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await CacheHelper.clearAllData();
  // await CacheHelper.clearAllSecuredData();
  Bloc.observer = MyBlocObserver();
  userToken = await CacheHelper.getSecuredString(key: CacheKeys.userToken);
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
  Locale startLocale;
  const supportedLocales = [Locale('ar'), Locale('en')];

  if (deviceLocale.languageCode == 'ar') {
    startLocale = const Locale('ar');
  } else {
    startLocale = const Locale('en');
  }

  await CacheHelper.saveData(
    key: CacheKeys.currentLanguage,
    value: startLocale.languageCode,
  );
  isAdmin = CacheHelper.getData(key: CacheKeys.role) != 1;
  log("User Token : $userToken");
  log("fcm Token : ${CacheHelper.getData(key: CacheKeys.deviceToken)}");
  log("Device lang : ${CacheHelper.getData(key: CacheKeys.currentLanguage)}");
  log("Device Locale : ${deviceLocale.toString()}");
  log("Start Locale : ${startLocale.toString()}");

  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en'),
      supportedLocales: supportedLocales,
      path: 'assets/languages',
      startLocale: startLocale,
      child: Phoenix(
        child: TaskApp(appRouter: AppRouter(), token: userToken),
      ),
    ),
  );
}

class TaskApp extends StatelessWidget {
  final AppRouter appRouter;
  final String? token;
  const TaskApp({super.key, required this.appRouter, required this.token});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Task'.tr(),
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: darkTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.dark,
              initialRoute: Routes.welcomeScreen,
              onGenerateRoute: appRouter.generateRoute,
              builder: EasyLoading.init(),
            );
          },
        ),
      ),
    );
  }
}
