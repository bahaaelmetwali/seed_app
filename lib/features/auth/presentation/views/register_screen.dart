import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';

import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<RegisterUseCase>()),
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(child: RegisterScreenBody()),
      ),
    );
  }
}
