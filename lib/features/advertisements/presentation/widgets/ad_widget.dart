import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/section_details.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({super.key, required this.advertisment});
  final Advertisment? advertisment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            children: [
              Container(
                height: 107.h,
                width: 85.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(Assets.iconsTest, fit: BoxFit.fill),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(advertisment!.name, style: TextStyles.textStyle14),
                  SizedBox(height: 4.h),
                  SectionDetails(advertisment: advertisment),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'تقييم المشروع:',
                        style: TextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        ' ${advertisment!.totalProjectEvaluation}',
                        style: TextStyles.textStyle16.copyWith(
                          color: Constants.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
