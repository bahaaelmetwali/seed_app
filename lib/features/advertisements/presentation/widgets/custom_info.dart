import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/core/utils/styles.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({super.key, required this.text, required this.iconPath});
  final String text;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 18.r, width: 18.r),
        SizedBox(width: 4.w),

        Text(
          text,
          style: TextStyles.textStyle12.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
