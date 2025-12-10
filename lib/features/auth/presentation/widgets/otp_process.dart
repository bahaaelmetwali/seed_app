import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';
import 'package:seed_app/core/widgets/custom_loading_indicator.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/domain/entity/verification.dart';
import 'package:seed_app/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';

class OtpProcess extends StatelessWidget {
  const OtpProcess({
    super.key,
    required this.otpController,
    required this.formKey,
  });
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSucess) {
          showCustomSnackBar(context, message: 'تم تسجيل الدخول بنجاح');
          context.go(AppRouterNames.homeUserScreen);
        } else if (state is SendOtpFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is SendOtpLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final Verification verification = Verification(
                  verificationCode: otpController.text,
                );
                context.read<SendOtpCubit>().sendOtp(verification);
              }
            },
            text: 'تأكيد',
          );
        }
      },
    );
  }
}
