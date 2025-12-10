import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          padding: EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
          child: SvgPicture.asset(
            'assets/logos/home_background.svg',
            height: 240.h,
            width: 260.w,
          ),
        ),
        CategoriesSection(),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      children: [
                        Container(
                          height: 130.h,
                          width: 100.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Image.asset(
                            'assets/icons/test.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'انشاء مركز طبي',
                              style: TextStyles.textStyle16,
                            ),
                            SizedBox(height: 4.h),
                            SectionDetails(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'تقييم المشروع:',
                                  style: TextStyles.textStyle16.copyWith(
                                    fontWeight: FontWeight.w500,
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
            CustomInfo(text: 'الرياض', iconPath: 'assets/icons/location.svg'),
            CustomInfo(text: 'الكتروني', iconPath: 'assets/icons/location.svg'),
          ],
        ),
        SizedBox(width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfo(
              text: '100,000 ريال',
              iconPath: 'assets/icons/money-send.svg',
            ),
            CustomInfo(
              text: '25 %',
              iconPath: 'assets/icons/percentage-circle.svg',
            ),
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
        SvgPicture.asset(iconPath),
        SizedBox(width: 2.w),

        Text(
          text,
          style: TextStyles.textStyle14.copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
