import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key});

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BackGroundWidget(),
            Container(
              height: 620.h,
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
                            text: "01:30",
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
    );
  }
}
