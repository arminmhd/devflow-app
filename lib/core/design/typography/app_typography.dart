import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'Inter';

  static TextTheme get textTheme => TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 48.sp,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40.sp,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),

    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),

    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),

    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),

    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
  );

  // Label
}
