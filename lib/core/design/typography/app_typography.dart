import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppTypography {
  const AppTypography._();

  static const instance = AppTypography._();

  static const String fontFamily = 'Inter';

  // Display
  TextStyle get displayLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  TextStyle get displayMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  TextStyle get displaySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  // Headline
  TextStyle get headlineLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  TextStyle get headlineMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  TextStyle get headlineSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  // Title
  TextStyle get titleLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  TextStyle get titleMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  TextStyle get titleSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  // Body
  TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  // Label
  TextStyle get labelLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  TextStyle get labelMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  TextStyle get labelSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
}

const appTypography = AppTypography._();
