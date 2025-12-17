import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/widgets/custom_loading_shimmer.dart';

class GetCitiesLoadingWidget extends StatelessWidget {
  const GetCitiesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: CustomLoadingShimmer(height: 50, width: 78),
        );
      },
    );
  }
}
