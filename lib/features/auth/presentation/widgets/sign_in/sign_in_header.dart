import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 0,
      bottom: 500.h,
      child: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: Image.asset(
          'assets/images/header.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
