import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.solidText,
    required this.navigationText,
    required this.onPressed,
    this.lineWidth,
  });
  final String solidText;
  final String navigationText;
  final int? lineWidth;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          solidText,
          style: TextStyles.textStyle14.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Column(
            children: [
              Text(
                navigationText,
                style: TextStyles.textStyle14.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                height: 2.h,
                width: (lineWidth != null) ? lineWidth!.w : 75.w,
                color: AppColors.kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
