import 'package:flutter/material.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/auth/presentation/widgets/loginc_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: SafeArea(child: LogincScreenBody()),
    );
  }
}
