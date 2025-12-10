import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 24.h,
          top: 36.h,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/logos/app_bar_logo.svg',
              height: 39.w,
              width: 120.w,
            ),
          ],
        ),
      ),
    );
  }
}
