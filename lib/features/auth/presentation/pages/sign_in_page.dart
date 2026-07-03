import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_content.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_header.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [SignInHeader(), SignInContent()]));
  }
}
