import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/constants/assets.dart';

class HomeBackGround extends StatelessWidget {
  const HomeBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.r, left: 24.r, right: 24.r),
      child: SvgPicture.asset(
        Assets.logosHomeBackground,
        height: 180.h,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}