import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/categories_section.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeAppBar(),
        Padding(
          padding: EdgeInsets.only(top: 16.r, left: 24.r, right: 24.r),
          child: SvgPicture.asset(
            Assets.logosHomeBackground,
            height: 166.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        CategoriesSection(),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
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
                          Text('انشاء مركز طبي', style: TextStyles.textStyle14),
                          SizedBox(height: 4.h),
                          SectionDetails(),
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
                                ' 1,000000',
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
          },
        ),
      ],
    );
  }
}

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
