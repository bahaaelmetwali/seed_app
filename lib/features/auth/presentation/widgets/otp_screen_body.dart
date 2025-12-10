import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';
import 'package:seed_app/core/widgets/custom_loading_indicator.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_state.dart';
import 'package:seed_app/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key});

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  int seconds = 90;
  Timer? timer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (callback) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer!.cancel();
      }
    });
  }

  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String remainingSecond = '$remainingSeconds';

    if (remainingSeconds < 60) {
      remainingSecond = '0$remainingSeconds';
    }

    return Form(
      key: _formKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
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
                          color: Constants.kPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "لتأكيد حسابك قم بادخال الكود المكون من 4 ارقام الذي تم ارساله في رساله الي رقم الهاتف 252 --- --- ---",
                              style: TextStyles.textStyle18.copyWith(
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            TextSpan(
                              text: "(تغيير الرقم)",
                              style: TextStyles.textStyle18.copyWith(
                                color: Constants.kPrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: ", ٍسيصلك الكود خلال ",
                              style: TextStyles.textStyle18.copyWith(
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            TextSpan(
                              text: '0$minutes:$remainingSecond',
                              style: TextStyles.textStyle18.copyWith(
                                color: Constants.kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomPinCodeTextField(otpController: otpController),
                      SizedBox(height: 40.h),
                      OtpProcess(
                        otpController: otpController,
                        formKey: _formKey,
                      ),
                      CustomNavigationButton(
                        solidText: 'لم تصلك رسالة تأكيد ؟',
                        navigationText: 'اعادة ارسال الكود',
                        lineWidth: 100,
                        onPressed: () {},
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        } else if (state is SendOtpFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {}
            },
            text: 'تأكيد',
          );
        }
      },
    );
  }
}
