import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sing_in_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInContent extends StatelessWidget {
  final TextEditingController? username;
  final TextEditingController? password;
  const SignInContent({super.key, this.username, this.password});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260.h,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              const Color.fromARGB(255, 7, 60, 140),
            ],
          ),
          borderRadius: context.radius.extraLargeTopRadius,
        ),
        width: double.infinity,

        child: Padding(
          padding: context.padding.screen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: SingInInfo()),
              Expanded(
                child: SignInForm(
                  usernameController: username ?? TextEditingController(),
                  passwordController: password ?? TextEditingController(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
