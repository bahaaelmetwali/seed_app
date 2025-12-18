import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';

class ShowAllDetails extends StatelessWidget {
  const ShowAllDetails({super.key, required this.details, required this.onTap});
  final String details;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(details, style: TextStyles.textStyle18),
        Spacer(),

        GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Text(
                'عرض الكل',
                style: TextStyles.textStyle14.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                height: 1.h,
                width: 60.w,
                color: AppColors.kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
