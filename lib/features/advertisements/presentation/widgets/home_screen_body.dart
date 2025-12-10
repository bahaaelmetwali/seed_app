import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),

          Padding(
            padding: EdgeInsets.all(16.r),
            child: SvgPicture.asset(
              'assets/logos/home_background.svg',
              width: double.infinity,
            ),
          ),
          CategoriesSection(),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('المدن', style: TextStyles.textStyle18),
              Spacer(),

              Column(
                children: [
                  Text(
                    'عرض الكل',
                    style: TextStyles.textStyle14.copyWith(
                      color: Constants.kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 2.h,
                    width: 60.w,
                    color: Constants.kPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.cities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.r),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45.h,
                      width: 83.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? Constants.kPrimaryColor
                              : Colors.white,
                          width: 1.5.r,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          Constants.cities[index],
                          style: TextStyles.textStyle16.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
