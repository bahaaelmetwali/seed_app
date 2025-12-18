import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/utils/validation.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    double fieldWidth = (MediaQuery.of(context).size.width - 80) / 4;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        validator: Validator.otpValidator,
        controller: otpController,
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        textStyle: TextStyles.textStyle16,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12.r),
          fieldHeight: 90.r,
          fieldWidth: fieldWidth,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          activeColor: AppColors.kPrimaryColor,
          selectedColor: AppColors.kPrimaryColor,
          inactiveColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
