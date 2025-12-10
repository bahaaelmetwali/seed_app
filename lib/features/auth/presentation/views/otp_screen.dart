import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/auth/domain/use_cases/verification_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendOtpCubit(getIt<VerificationUseCase>()),
      child: Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: SafeArea(child: OtpScreenBody(phoneNumber: phoneNumber)),
      ),
    );
  }
}
