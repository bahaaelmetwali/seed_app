import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogincScreenBody extends StatelessWidget {
  const LogincScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 162.h,
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 70.h,
                    left: 0.w,
                    right: 0.w,
                    child: SvgPicture.asset(
                      'assets/logos/logo.svg',
                      height: 44.h,
                      width: 170.w,
                    ),
                  ),
                  Positioned(
                    top: -10.h,
                    left: 0.w,
                    right: 0.w,
                    child: SvgPicture.asset(
                      'assets/logos/background_image.svg',
                      height: 207.h,
                      width: 175.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 620.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
