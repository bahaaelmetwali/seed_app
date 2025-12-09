import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.solidText,
    required this.navigationText,
    required this.onPressed,
  });
  final String solidText;
  final String navigationText;
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
                  color: Constants.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                height: 2.h,
                width: 115.w,
                color: Constants.kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
