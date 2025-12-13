import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/custom_info.dart';

class SectionDetails extends StatelessWidget {
  const SectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfo(text: 'الرياض', iconPath: Assets.iconsLocation),
            CustomInfo(text: 'الكتروني', iconPath: Assets.iconsMonitor),
          ],
        ),
        SizedBox(width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfo(text: '100,000 ريال', iconPath: Assets.iconsMoneySend),
            CustomInfo(text: '25 %', iconPath: Assets.iconsPercentageCircle),
          ],
        ),
      ],
    );
  }
}
