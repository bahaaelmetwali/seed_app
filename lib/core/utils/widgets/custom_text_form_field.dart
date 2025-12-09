import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.name,
    required this.hintText,

    this.iconPath,
    this.validator,
    this.controller,
    this.nameTextStyle,
    this.suffixIcon,
    this.isDescription = false,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.height,
    this.obscureText = false,
    this.onChanged,
  });
  final String name;
  final TextStyle? nameTextStyle;
  final Widget? suffixIcon;
  final String hintText;
  final String? iconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isDescription;
  final TextInputType textInputType;
  final bool readOnly;
  final double? height;
  final bool obscureText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: nameTextStyle == null
              ? TextStyles.textStyle16
              : nameTextStyle!,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 345.w,
          child: TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            readOnly: readOnly,
            minLines: isDescription ? 3 : 1,
            maxLines: isDescription ? null : 1,
            validator: validator,
            controller: controller,
            style: TextStyles.textStyle16.copyWith(
              color: readOnly ? Colors.grey : Colors.black,
            ),

            keyboardType: textInputType,
            decoration: InputDecoration(
              isDense: false,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 18.h,
              ),
              prefixIcon: iconPath != null
                  ? Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: SvgPicture.asset(
                        iconPath!,
                        width: 20.w,
                        height: 20.h,
                      ),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(
                minWidth: 20.w,
                minHeight: 20.h,
              ),
              suffixIcon: suffixIcon != null
                  ? Padding(padding: EdgeInsets.all(8.sp), child: suffixIcon)
                  : null,
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyles.textStyle16.copyWith(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: readOnly
                      ? Colors.grey.shade300
                      : Constants.kPrimaryColor,
                  width: 1.5,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
