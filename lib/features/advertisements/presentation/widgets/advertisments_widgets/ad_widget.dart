import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_loading_shimmer.dart';
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
                child: CachedNetworkImage(
                  imageUrl: advertisment!.image,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: CustomLoadingShimmer(height: 107.h, width: 85.w),
                  ),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.broken_image)),
                ),
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
                          color: AppColors.kPrimaryColor,
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
