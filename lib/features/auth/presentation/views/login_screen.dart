import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/loginc_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginUseCase>()),
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(child: LogincScreenBody()),
      ),
    );
  }
}
