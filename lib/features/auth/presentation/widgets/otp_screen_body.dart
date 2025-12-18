import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:seed_app/features/auth/presentation/widgets/loading_over_relay.dart';
import 'package:seed_app/features/auth/presentation/widgets/otp_process.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  Timer? timer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int totalSeconds = 90;
  void startTimer() {
    int seconds = 90;

    timer = Timer.periodic(Duration(seconds: 1), (callback) {
      if (!mounted) return;
      if (seconds > 0) {
        setState(() {
          seconds--;
          totalSeconds = seconds;
        });
      } else {
        timer!.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int minutes = totalSeconds ~/ 60;
    int remainingSeconds = totalSeconds % 60;
    String remainingSecond = '$remainingSeconds';

    if (remainingSeconds < 10) {
      remainingSecond = '0$remainingSeconds';
    }

    return Form(
      key: _formKey,
      child: BlocBuilder<SendOtpCubit, SendOtpState>(
        builder: (context, state) {
          bool isLoading = state is SendOtpLoading;
          return BlocConsumer<ResendOtpCubit, ResendOtpState>(
            listener: (context, state) {
              if (state is ResendOtpSuccess) {
                showCustomSnackBar(
                  context,
                  message: 'تم اعادة ارسال الكود بنجاح ',
                );
              } else if (state is ResendOtpFailure) {
                showCustomSnackBar(context, message: state.message);
              }
            },
            builder: (context, state) {
              final isResendOtpLoading = state is ResendOtpLoading;
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AbsorbPointer(
                  absorbing: isLoading,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            BackGroundWidget(),
                            Container(
                              height: 650.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.r),
                                  topRight: Radius.circular(40.r),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(30.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      'تأكيد رقم الهاتف',
                                      style: TextStyles.textStyle20.copyWith(
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomRichText(
                                      minutes: minutes,
                                      remainingSecond: remainingSecond,
                                      phoneNumber: widget.phoneNumber,
                                    ),
                                    SizedBox(height: 40.h),
                                    CustomPinCodeTextField(
                                      otpController: otpController,
                                    ),
                                    SizedBox(height: 40.h),
                                    OtpProcess(
                                      otpController: otpController,
                                      formKey: _formKey,
                                    ),
                                    CustomNavigationButton(
                                      solidText: 'لم تصلك رسالة تأكيد ؟',
                                      navigationText: 'اعادة ارسال الكود',
                                      lineWidth: 100,
                                      onPressed: () async {
                                        if (totalSeconds == 0) {
                                          await context
                                              .read<ResendOtpCubit>()
                                              .resendOtp();
                                          timer?.cancel();
                                          startTimer();
                                        }
                                      },
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isResendOtpLoading == true
                          ? LoadingOverlay()
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
