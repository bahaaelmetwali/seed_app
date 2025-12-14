import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/ads_list_widget.dart';
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
        AdsListWidget(),
      ],
    );
  }
}
