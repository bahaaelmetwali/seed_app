import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/core/utils/validation.dart';
import 'package:seed_app/core/ui/custom_text_form_field.dart';

class CustomTextFormFieldsSection extends StatelessWidget {
  const CustomTextFormFieldsSection({
    super.key,
    required this.nameEditingController,
    required this.mobileEditingController,
    required this.emailEditingController,
  });

  final TextEditingController nameEditingController;
  final TextEditingController mobileEditingController;
  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          name: 'الاسم',
          hintText: 'ادخل الاسم',
          iconPath: Assets.iconsUser,
          controller: nameEditingController,
          validator: Validator.nameValidator,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          name: 'رقم الجوال',
          hintText: 'ادخل رقم جوالك',
          iconPath: Assets.iconsMobile,
          controller: mobileEditingController,
          validator: Validator.phoneValidator,
        ),
        SizedBox(height: 5.h),

        CustomTextFormField(
          name: 'البريد الإلكتروني',
          hintText: 'ادخل البريد الإلكتروني',
          iconPath: Assets.iconsSms,
          validator: Validator.emailValidator,
          controller: emailEditingController,
        ),
      ],
    );
  }
}
