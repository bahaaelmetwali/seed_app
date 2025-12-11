
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key, required this.height, required this.width,
  });
final double height ;
final double width ; 
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 3),
      interval: Duration(seconds: 5),
      color: Colors.grey,
      colorOpacity: 0,
      enabled: true,
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        height: height.h,
        width: width.w,
        color: Colors.white,
      ),
    );
  }
}
