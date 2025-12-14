import 'package:flutter/material.dart';

import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/auth/presentation/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: SafeArea(child: RegisterScreenBody()),
    );
  }
}
