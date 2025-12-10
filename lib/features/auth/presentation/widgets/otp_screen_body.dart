import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:seed_app/features/auth/presentation/widgets/otp_process.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key, required this.phoneNumber});
  final String phoneNumber;

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

    if (remainingSeconds < 10) {
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
                      CustomRichText(
                        minutes: minutes,
                        remainingSecond: remainingSecond,
                        phoneNumber: widget.phoneNumber,
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
