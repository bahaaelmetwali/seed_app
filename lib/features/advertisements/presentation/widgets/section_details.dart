import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/advertisments_widgets/custom_info.dart';

class SectionDetails extends StatelessWidget {
  const SectionDetails({super.key, required this.advertisment});
  final Advertisment? advertisment;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfo(
              text: advertisment!.city,
              iconPath: Assets.iconsLocation,
            ),
            CustomInfo(
              text: advertisment!.isOnline == 0 ? 'غير الكتروني' : 'الكتروني',
              iconPath: Assets.iconsMonitor,
            ),
          ],
        ),
        SizedBox(width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfo(
              text: '${advertisment!.askMoney}',
              iconPath: Assets.iconsMoneySend,
            ),
            CustomInfo(
              text: '${advertisment!.partnershipRatio}',
              iconPath: Assets.iconsPercentageCircle,
            ),
          ],
        ),
      ],
    );
  }
}
