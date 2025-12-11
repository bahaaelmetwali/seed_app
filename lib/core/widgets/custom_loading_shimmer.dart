import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.r),
      child: Shimmer(
        duration: Duration(seconds: 1),
        interval: Duration(seconds: 1),
        color: Colors.black54,
        colorOpacity: 0,
        enabled: true,
        direction: ShimmerDirection.fromRTLB(),
        child: Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
