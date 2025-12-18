import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/constants/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isMainColor = true,
  });
  final void Function()? onPressed;
  final String text;
  final bool isMainColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 66.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isMainColor ? Colors.white : AppColors.kPrimaryColor,
            width: 1.5.r,
          ),
          color: isMainColor ? AppColors.kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.textStyle16.copyWith(
                color: isMainColor ? Colors.white : AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
