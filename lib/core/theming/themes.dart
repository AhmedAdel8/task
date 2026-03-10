import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Satoshi',
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: const Color(0xFF0F1728),
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFF5F6FA),
      letterSpacing: -0.3,
    ),
    iconTheme: IconThemeData(color: AppColors.primaryColor, size: 20.sp),
    actionsIconTheme: IconThemeData(color: AppColors.primaryColor, size: 20.sp),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xFF1A1F2E),
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: const Color(0xFF6B7280),
    selectedLabelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color(0xFF1A1F2E),
    indicatorColor: AppColors.primaryColor.withValues(alpha: 0.2),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        );
      }
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF6B7280),
      );
    }),
  ),
  scaffoldBackgroundColor: const Color(0xFF0F1728),
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryColor,
    primaryContainer: Color(0xFF1E2A45),
    secondary: AppColors.secondaryColor,
    secondaryContainer: Color(0xFF1E2A35),
    tertiary: AppColors.accentColor,
    tertiaryContainer: Color(0xFF1E2830),
    surface: Color(0xFF1A1F2E),
    surfaceContainerHighest: Color(0xFF252B3B),
    error: AppColors.errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFFF0F2F8),
    onError: Colors.white,
    brightness: Brightness.dark,
    outline: Color(0xFF2E3548),
    shadow: Colors.black54,
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF1A1F2E),
    elevation: 2,
    shadowColor: Colors.black38,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonColor,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.disabledButtonColor.withValues(
        alpha: 0.4,
      ),
      disabledForegroundColor: Colors.white38,
      elevation: 2,
      shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textButtonColor,
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      side: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      iconSize: 24.sp,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E2436),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xFF2E3548), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xFF2E3548), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xFF252B3B), width: 1),
    ),
    hintStyle: TextStyle(
      color: const Color(0xFF4B5568),
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: TextStyle(
      color: const Color(0xFF8896AA),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
    prefixIconColor: const Color(0xFF6B7280),
    suffixIconColor: const Color(0xFF6B7280),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: const BorderSide(color: Color(0xFF4B5568), width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return const Color(0xFF4B5568);
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return const Color(0xFF4B5568);
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return const Color(0xFF2E3548);
    }),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: AppColors.primaryColor,
    inactiveTrackColor: const Color(0xFF2E3548),
    thumbColor: AppColors.primaryColor,
    overlayColor: AppColors.primaryColor.withValues(alpha: 0.2),
    valueIndicatorColor: AppColors.primaryColor,
    valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
    linearTrackColor: Color(0xFF2E3548),
    circularTrackColor: Color(0xFF2E3548),
  ),
  dividerTheme: DividerThemeData(
    color: const Color(0xFF2E3548),
    thickness: 1,
    space: 1,
    indent: 16.w,
    endIndent: 16.w,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFF1E2436),
    selectedColor: AppColors.primaryColor.withValues(alpha: 0.2),
    disabledColor: const Color(0xFF252B3B),
    labelStyle: TextStyle(color: const Color(0xFFF0F2F8), fontSize: 14.sp),
    secondaryLabelStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14.sp,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: const Color(0xFF1A1F2E),
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    titleTextStyle: TextStyle(
      color: const Color(0xFFF0F2F8),
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(
      color: const Color(0xFF8896AA),
      fontSize: 16.sp,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: const Color(0xFF1A1F2E),
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    modalBackgroundColor: const Color(0xFF1A1F2E),
    modalElevation: 8,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: const Color(0xFF252B3B),
    contentTextStyle: TextStyle(
      color: const Color(0xFFF0F2F8),
      fontSize: 14.sp,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    behavior: SnackBarBehavior.floating,
    elevation: 4,
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: AppColors.primaryColor,
    unselectedLabelColor: const Color(0xFF6B7280),
    indicatorColor: AppColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: const Color(0xFF252B3B),
      borderRadius: BorderRadius.circular(8.r),
    ),
    textStyle: TextStyle(color: const Color(0xFFF0F2F8), fontSize: 12.sp),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    iconColor: AppColors.primaryColor,
    textColor: const Color(0xFFF0F2F8),
    tileColor: Colors.transparent,
    selectedColor: AppColors.primaryColor,
    selectedTileColor: AppColors.primaryColor.withValues(alpha: 0.15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: const Color(0xFF1A1F2E),
    elevation: 16,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16.r),
        bottomRight: Radius.circular(16.r),
      ),
    ),
  ),
  badgeTheme: const BadgeThemeData(
    backgroundColor: AppColors.errorColor,
    textColor: Colors.white,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor.withValues(alpha: 0.3),
    selectionHandleColor: AppColors.primaryColor,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFF0F2F8),
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF0F2F8),
    ),
    displaySmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF0F2F8),
    ),
    headlineLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF0F2F8),
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF0F2F8),
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF0F2F8),
    ),
    titleLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF0F2F8),
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF0F2F8),
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF0F2F8),
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFF0F2F8),
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF8896AA),
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6B7280),
    ),
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF8896AA),
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF6B7280),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
  highlightColor: AppColors.primaryColor.withValues(alpha: 0.05),
  hoverColor: AppColors.primaryColor.withValues(alpha: 0.05),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
