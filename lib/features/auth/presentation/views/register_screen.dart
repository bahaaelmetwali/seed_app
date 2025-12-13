import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginUseCase>()),
      child: Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: SafeArea(child: RegisterScreenBody()),
      ),
    );
  }
}
