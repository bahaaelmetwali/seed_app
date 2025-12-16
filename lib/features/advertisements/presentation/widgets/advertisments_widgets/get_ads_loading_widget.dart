import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/widgets/custom_loading_shimmer.dart';

class GetAdsLoadingWidget extends StatelessWidget {
  const GetAdsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
      child: CustomLoadingShimmer(height: 107, width: 85),
    );
  }
}
