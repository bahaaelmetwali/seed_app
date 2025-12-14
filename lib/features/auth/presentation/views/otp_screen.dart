import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:seed_app/features/auth/domain/use_cases/verification_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/cubit/resend_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendOtpCubit(getIt<VerificationUseCase>()),
        ),
        BlocProvider(
          create: (context) => ResendOtpCubit(getIt<ResendOtpUseCase>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: SafeArea(child: OtpScreenBody(phoneNumber: phoneNumber)),
      ),
    );
  }
}
